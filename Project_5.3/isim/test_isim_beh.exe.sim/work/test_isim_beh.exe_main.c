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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001044160846_2352116331_init();
    work_m_00000000002292568379_0345418465_init();
    work_m_00000000000066459734_0621066737_init();
    work_m_00000000000519953289_0757879789_init();
    work_m_00000000003086265611_1785967555_init();
    work_m_00000000004211992930_1579609468_init();
    work_m_00000000000844439654_2772236470_init();
    work_m_00000000001655788630_2727828934_init();
    work_m_00000000003168294311_1648104263_init();
    work_m_00000000000121141731_0103510313_init();
    work_m_00000000003953330061_2820835569_init();
    work_m_00000000002407009870_0886308060_init();
    work_m_00000000003210935302_3666345988_init();
    work_m_00000000000254764466_4024466370_init();
    work_m_00000000000682015658_4284950183_init();
    work_m_00000000003257435856_2520395732_init();
    work_m_00000000004166303203_3046170410_init();
    work_m_00000000002058655132_3877310806_init();
    work_m_00000000002047498008_1985558087_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002047498008_1985558087");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
