masm /Zi main.asm ,,,;
masm /Zi menu.asm ,,,;
masm /Zi input.asm ,,,;
masm /Zi bins.asm ,,,;
masm /Zi binu.asm ,,,;
masm /Zi decu.asm ,,,;
masm /Zi decs.asm ,,,;
masm /Zi hexu.asm ,,,;
masm /Zi hexs.asm ,,,;
link /Co main.obj menu.obj input.obj bins.obj binu.obj decu.obj decs.obj hexu.obj hexs.obj ,,;
