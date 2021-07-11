<template>
  <div id="app">
    <h1>Todo App</h1>
    <form @submit.prevent>
      <input type="text" v-model="title">
      <button @click="handleCreateTodo">Add</button>
    </form>
    <p v-for="(todo, index) in todos" v-bind:key="todo.id">
      {{ todo.title }} <button @click="handleDeleteTodo(todo.id, index)">Delete</button>
    </p>
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue' // defineComponent関数（Vue3でTypeScriptを取り入れる場合に必要）を読み込む
import { getTodos, createTodo, deleteTodo } from './lib/api/todos' // APIを呼び出すための関数を読み込む
import { Todo } from './interfaces/index' // 型定義を読み込む

export default defineComponent({
  name: 'App',
  data: () => ({
    todos: [] as Todo[], // todos: Todo型の配列
    title: ''
  }),
  methods: {
    // Todo一覧を取得
    handleGetTodos: async function(): Promise<void> {
      try {
        const res = await getTodos()

        if (res?.status === 200) {
          this.todos = res.data.todos // todos（配列）に結果を格納
        }
      } catch (err) {
        console.log(err)
      }
    },
    // Todoの新規作成
    handleCreateTodo: async function(): Promise<void> {
      if (this.title === '') return // 入力が空だった場合は以降の処理を行わない

      // Todo型に沿ったデータを作成
      const data: Todo = {
        title: this.title
      }

      try {
        const res = await createTodo(data)

        if (res?.status === 200) {
          this.todos.push(res.data.todo) // todos（配列）の最後尾にtodoを追加
        } else {
          console.log(res.data.message)
        }
      } catch (err) {
        console.log(err)
      }

      this.title = '' // 追加後はtitleを空にする（フォーム内がリセットされる）
    },
    // Todoの削除
    handleDeleteTodo: async function(id: number, index: number): Promise<void> {
      if (id == null) return // idが無かった場合は以降の処理を行わない
      
      try {
        const res = await deleteTodo(id)

        if (res?.status === 200) {
          this.todos.splice(index, 1) // インデックス（index）に位置する要素を1つ削除
        } else {
          console.log(res.data.message)
        }
      } catch (err) {
        console.log(err)
      }
    }
  },
  mounted: function() {
    this.handleGetTodos() // Vueインスタンスがマウントされるたびに実行される関数
  }
})
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
