###HW2
===
## 1. 實驗題目 
撰寫簡易組合語言觀察 push 與 pop 兩指令之執行
## 2. 實驗步驟
1. 先將資料夾 gnu-mcu-eclipse-qemu 完整複製到 ESEmbedded_HW02 資料夾中

2. 根據題目要求設計程式，觀察push {r0,r1,r2} 與 push{r5,r4,r3}對堆疊記憶體的順序是否有差別。

3. 設計測試程式` main.s `，從` _start `開始後依序執行pop` `以及` push`

4. 先將數值存入register方便觀察


main.s:

```assembly
_start:
	mov	r0,#100
	mov	r1,#200
	mov	r2,#300
	mov	r3,#500
	mov	r4,#600
	mov	r5,#800
	//
	push	{r0,r1,r2}
	push	{r5,r4,r3}
	mov	r6,#900
	pop	{r6,r7,r8}
	pop	{r5,r4,r3}
	b	.
```

5. 將 main.s 編譯， `$ make clean`, `$ make`,再以 qemu 模擬 `$ make qemu`
記得要開啟另一 Terminal 連線 `$ arm-none-eabi-gdb` ，再輸入 `target remote localhost:1234` 連接，輸入 `layout regs`, 開啟 Register 以及指令，並且輸入 `si` 一步步執行觀察。


當執行`push`完由下圖可以看出堆疊為由register大的先存入

![](https://github.com/pohsaung/ESEmbedded_HW02/blob/master/push1.jpg)

當執行到`pop`完由下圖可以看出由register大的先存入

![](https://github.com/pohsaung/ESEmbedded_HW02/blob/master/pop1.jpg)

## 3. 結果與討論
 1. 由上方實驗可以看出`push`和`pop`sp的增減方向相反，也就是FILO

 2. `push`和`pop`"{}"中的順序並不影響堆疊次序




