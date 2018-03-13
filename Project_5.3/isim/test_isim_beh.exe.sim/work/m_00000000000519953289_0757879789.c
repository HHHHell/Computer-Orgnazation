/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "D:/ISE/Project_5.3/NPC.v";
static int ng1[] = {0, 0};
static int ng2[] = {4, 0};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {0U, 0U};
static int ng5[] = {2, 0};



static void Cont_28_0(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t36[8];
    char t37[8];
    char t42[8];
    char t43[8];
    char t46[8];
    char t73[8];
    char t75[8];
    char t85[8];
    char t99[8];
    char t100[8];
    char t103[8];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    char *t35;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t44;
    char *t45;
    char *t47;
    char *t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    char *t61;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    char *t68;
    char *t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    char *t74;
    char *t76;
    char *t77;
    char *t78;
    unsigned int t79;
    unsigned int t80;
    unsigned int t81;
    unsigned int t82;
    unsigned int t83;
    unsigned int t84;
    char *t86;
    char *t87;
    char *t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    unsigned int t93;
    unsigned int t94;
    unsigned int t95;
    unsigned int t96;
    unsigned int t97;
    unsigned int t98;
    char *t101;
    char *t102;
    char *t104;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    unsigned int t112;
    unsigned int t113;
    unsigned int t114;
    unsigned int t115;
    unsigned int t116;
    unsigned int t117;
    char *t118;
    char *t119;
    unsigned int t120;
    unsigned int t121;
    unsigned int t122;
    unsigned int t123;
    unsigned int t124;
    char *t125;
    char *t126;
    unsigned int t127;
    unsigned int t128;
    unsigned int t129;
    char *t130;
    char *t131;
    unsigned int t132;
    unsigned int t133;
    unsigned int t134;
    unsigned int t135;
    char *t136;
    char *t137;
    char *t138;
    char *t139;
    char *t140;
    char *t141;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(28, ng0);
    t2 = (t0 + 1048U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng1)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t38 = *((unsigned int *)t4);
    t39 = (~(t38));
    t40 = *((unsigned int *)t29);
    t41 = (t39 || t40);
    if (t41 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t42, 8);

LAB20:    t130 = (t0 + 3088);
    t137 = (t130 + 56U);
    t138 = *((char **)t137);
    t139 = (t138 + 56U);
    t140 = *((char **)t139);
    memcpy(t140, t3, 8);
    xsi_driver_vfirst_trans(t130, 0, 31);
    t141 = (t0 + 3008);
    *((int *)t141) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = (t0 + 1208U);
    t34 = *((char **)t33);
    t33 = (t0 + 1368U);
    t35 = *((char **)t33);
    t33 = ((char*)((ng2)));
    memset(t36, 0, 8);
    xsi_vlog_unsigned_multiply(t36, 32, t35, 32, t33, 32);
    memset(t37, 0, 8);
    xsi_vlog_unsigned_add(t37, 32, t34, 32, t36, 32);
    goto LAB13;

LAB14:    t44 = (t0 + 1048U);
    t45 = *((char **)t44);
    t44 = ((char*)((ng3)));
    memset(t46, 0, 8);
    t47 = (t45 + 4);
    t48 = (t44 + 4);
    t49 = *((unsigned int *)t45);
    t50 = *((unsigned int *)t44);
    t51 = (t49 ^ t50);
    t52 = *((unsigned int *)t47);
    t53 = *((unsigned int *)t48);
    t54 = (t52 ^ t53);
    t55 = (t51 | t54);
    t56 = *((unsigned int *)t47);
    t57 = *((unsigned int *)t48);
    t58 = (t56 | t57);
    t59 = (~(t58));
    t60 = (t55 & t59);
    if (t60 != 0)
        goto LAB24;

LAB21:    if (t58 != 0)
        goto LAB23;

LAB22:    *((unsigned int *)t46) = 1;

LAB24:    memset(t43, 0, 8);
    t62 = (t46 + 4);
    t63 = *((unsigned int *)t62);
    t64 = (~(t63));
    t65 = *((unsigned int *)t46);
    t66 = (t65 & t64);
    t67 = (t66 & 1U);
    if (t67 != 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t62) != 0)
        goto LAB27;

LAB28:    t69 = (t43 + 4);
    t70 = *((unsigned int *)t43);
    t71 = *((unsigned int *)t69);
    t72 = (t70 || t71);
    if (t72 > 0)
        goto LAB29;

LAB30:    t95 = *((unsigned int *)t43);
    t96 = (~(t95));
    t97 = *((unsigned int *)t69);
    t98 = (t96 || t97);
    if (t98 > 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t69) > 0)
        goto LAB33;

LAB34:    if (*((unsigned int *)t43) > 0)
        goto LAB35;

LAB36:    memcpy(t42, t99, 8);

LAB37:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 32, t37, 32, t42, 32);
    goto LAB20;

LAB18:    memcpy(t3, t37, 8);
    goto LAB20;

LAB23:    t61 = (t46 + 4);
    *((unsigned int *)t46) = 1;
    *((unsigned int *)t61) = 1;
    goto LAB24;

LAB25:    *((unsigned int *)t43) = 1;
    goto LAB28;

LAB27:    t68 = (t43 + 4);
    *((unsigned int *)t43) = 1;
    *((unsigned int *)t68) = 1;
    goto LAB28;

LAB29:    t74 = ((char*)((ng4)));
    t76 = (t0 + 1368U);
    t77 = *((char **)t76);
    memset(t75, 0, 8);
    t76 = (t75 + 4);
    t78 = (t77 + 4);
    t79 = *((unsigned int *)t77);
    t80 = (t79 >> 0);
    *((unsigned int *)t75) = t80;
    t81 = *((unsigned int *)t78);
    t82 = (t81 >> 0);
    *((unsigned int *)t76) = t82;
    t83 = *((unsigned int *)t75);
    *((unsigned int *)t75) = (t83 & 67108863U);
    t84 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t84 & 67108863U);
    t86 = (t0 + 1208U);
    t87 = *((char **)t86);
    memset(t85, 0, 8);
    t86 = (t85 + 4);
    t88 = (t87 + 4);
    t89 = *((unsigned int *)t87);
    t90 = (t89 >> 28);
    *((unsigned int *)t85) = t90;
    t91 = *((unsigned int *)t88);
    t92 = (t91 >> 28);
    *((unsigned int *)t86) = t92;
    t93 = *((unsigned int *)t85);
    *((unsigned int *)t85) = (t93 & 15U);
    t94 = *((unsigned int *)t86);
    *((unsigned int *)t86) = (t94 & 15U);
    xsi_vlogtype_concat(t73, 32, 32, 3U, t85, 4, t75, 26, t74, 2);
    goto LAB30;

LAB31:    t101 = (t0 + 1048U);
    t102 = *((char **)t101);
    t101 = ((char*)((ng5)));
    memset(t103, 0, 8);
    t104 = (t102 + 4);
    t105 = (t101 + 4);
    t106 = *((unsigned int *)t102);
    t107 = *((unsigned int *)t101);
    t108 = (t106 ^ t107);
    t109 = *((unsigned int *)t104);
    t110 = *((unsigned int *)t105);
    t111 = (t109 ^ t110);
    t112 = (t108 | t111);
    t113 = *((unsigned int *)t104);
    t114 = *((unsigned int *)t105);
    t115 = (t113 | t114);
    t116 = (~(t115));
    t117 = (t112 & t116);
    if (t117 != 0)
        goto LAB41;

LAB38:    if (t115 != 0)
        goto LAB40;

LAB39:    *((unsigned int *)t103) = 1;

LAB41:    memset(t100, 0, 8);
    t119 = (t103 + 4);
    t120 = *((unsigned int *)t119);
    t121 = (~(t120));
    t122 = *((unsigned int *)t103);
    t123 = (t122 & t121);
    t124 = (t123 & 1U);
    if (t124 != 0)
        goto LAB42;

LAB43:    if (*((unsigned int *)t119) != 0)
        goto LAB44;

LAB45:    t126 = (t100 + 4);
    t127 = *((unsigned int *)t100);
    t128 = *((unsigned int *)t126);
    t129 = (t127 || t128);
    if (t129 > 0)
        goto LAB46;

LAB47:    t132 = *((unsigned int *)t100);
    t133 = (~(t132));
    t134 = *((unsigned int *)t126);
    t135 = (t133 || t134);
    if (t135 > 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t126) > 0)
        goto LAB50;

LAB51:    if (*((unsigned int *)t100) > 0)
        goto LAB52;

LAB53:    memcpy(t99, t136, 8);

LAB54:    goto LAB32;

LAB33:    xsi_vlog_unsigned_bit_combine(t42, 32, t73, 32, t99, 32);
    goto LAB37;

LAB35:    memcpy(t42, t73, 8);
    goto LAB37;

LAB40:    t118 = (t103 + 4);
    *((unsigned int *)t103) = 1;
    *((unsigned int *)t118) = 1;
    goto LAB41;

LAB42:    *((unsigned int *)t100) = 1;
    goto LAB45;

LAB44:    t125 = (t100 + 4);
    *((unsigned int *)t100) = 1;
    *((unsigned int *)t125) = 1;
    goto LAB45;

LAB46:    t130 = (t0 + 1368U);
    t131 = *((char **)t130);
    goto LAB47;

LAB48:    t130 = (t0 + 1208U);
    t136 = *((char **)t130);
    goto LAB49;

LAB50:    xsi_vlog_unsigned_bit_combine(t99, 32, t131, 32, t136, 32);
    goto LAB54;

LAB52:    memcpy(t99, t131, 8);
    goto LAB54;

}


extern void work_m_00000000000519953289_0757879789_init()
{
	static char *pe[] = {(void *)Cont_28_0};
	xsi_register_didat("work_m_00000000000519953289_0757879789", "isim/test_isim_beh.exe.sim/work/m_00000000000519953289_0757879789.didat");
	xsi_register_executes(pe);
}
