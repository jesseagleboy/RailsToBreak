import { signal, computed } from '@preact/signals-react'


export const count = signal( 0 )
export const countComputed = computed( () => {
    return count.value * 10
})