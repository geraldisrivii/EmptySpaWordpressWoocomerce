<template>
    <router-view></router-view>
</template>
<script setup lang="ts">
import { Ref, computed, onMounted, ref, watch } from 'vue';

// STORE
import { useVuex } from './store/useVuex';

// DATA
let isDataLoaded: Ref<boolean> = ref(false);

declare var preloaderClose: () => void

onMounted(async () => {
    isDataLoaded.value = false
    preloaderClose()

})
</script>
<style lang="scss">
@import url('https://fonts.googleapis.com/css2?family=Rubik:wght@300;400;500;600;900&display=swap');

@import '@/scss/base/variables.scss';
@import '@/scss/base/mixins.scss';
@import '@/scss/base/typography.scss';


* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;

    &::-webkit-scrollbar-track {
        background-color: transparent;
    }

    &::-webkit-scrollbar {
        width: 10px;
        height: 10px;
    }

    &::-webkit-scrollbar-thumb {
        background: #858585;
        border-radius: 100px;
        cursor: pointer;
    }

    &::-webkit-scrollbar-button {
        display: none;
    }
}



html {
    font-size: 62.5%;

    scroll-behavior: smooth;
    overflow-x: hidden;


    @include min-table {
        font-size: 50%;
    }

    @include phone {
        font-size: 42%;
    }
}

body {
    font-family: Rubik;
    font-size: 18px;
    color: white;
    background-color: $background-color;
    overflow-x: hidden;
}

button {
    border: none;
    font-size: 16px;
    font-family: Rubik;
    cursor: pointer;
    background-color: transparent;

    &:disabled {
        cursor: not-allowed;

        img {
            opacity: 0.3;
        }
    }

}

ul {
    list-style: none;
}

.container {
    max-width: 1200px;
    margin: 0 auto;

    @media (max-width: 1200px) {
        padding: 0 10px;
    }
}

a {
    text-decoration: none;
}

input {
    border: none;
    outline: none;

    &:focus {
        outline: none;
    }
}

.button {
    color: #000;
    font-family: Rubik;
    font-size: 16px;
    font-style: normal;
    font-weight: 400;
    line-height: normal;
    text-transform: uppercase;
    display: inline-block;
    border-radius: 5px;
    background: #66E3FF;
    box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
    padding: 17px 34px;
    text-align: center;
    transition: all .3s ease-in-out;
    cursor: pointer;

    &:disabled {
        background: #585858;
        cursor: not-allowed;
    }

    &_white {
        background: #E4E4E4;
    }

    &_check-box {
        background: #141414;
        color: white;

        &--active {
            background: #2D2D2D;
        }
    }
}

.input {
    padding: 15px 21px;
    border-radius: 5px;
    background-color: #E4E4E4;

    font-family: Rubik;
    font-size: 18px;

    font-weight: 500;

    &::placeholder {
        color: #000;
        font-family: Rubik;
        font-size: 18px;
        font-style: normal;
        font-weight: 300;
        line-height: normal;
        letter-spacing: 0.18px;
    }
}

.text-area {
    padding: 15px 21px;
    border-radius: 5px;
    background-color: #E4E4E4;

    font-family: Rubik;
    font-size: 18px;

    font-weight: 500;

    resize: none;

    outline-offset: 0px;

    &::placeholder {
        color: #000;
        font-family: Rubik;
        font-size: 18px;
        font-style: normal;
        font-weight: 300;
        line-height: normal;
        letter-spacing: 0.18px;

    }

    &:focus-visible {
        border: none;
        outline: none;
        transform: none;
    }
}

.line {
    width: 50px;
    height: 7px;
    background-color: white;
}



.close-button {
    position: relative;
    height: 40px;
    width: 40px;

    &__line {
        position: absolute;
        top: 50%;
        left: 50%;
        height: 40px;
        width: 2px;
        background-color: white;
        border-radius: 2px;

        &_1 {
            transform: translate(-50%, -50%) rotate(45deg);
        }

        &_2 {
            transform: translate(-50%, -50%) rotate(-45deg);
        }
    }
}
</style>