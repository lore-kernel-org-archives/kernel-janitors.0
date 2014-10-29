From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 29 Oct 2014 09:24:43 +0000
Subject: re: ssb: get alp clock from devices with PMU
Message-Id: <20141029092443.GA9208@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Hauke Mehrtens,

The patch f924e1e989b0: "ssb: get alp clock from devices with PMU"
from Dec 5, 2012, leads to the following static checker warning:

	drivers/ssb/driver_chipcommon_pmu.c:624 ssb_pmu_get_alp_clock_clk0()
	warn: shift is higher precedence than mask

drivers/ssb/driver_chipcommon_pmu.c
   619  static u32 ssb_pmu_get_alp_clock_clk0(struct ssb_chipcommon *cc)
   620  {
   621          u32 crystalfreq;
   622          const struct pmu0_plltab_entry *e = NULL;
   623  
   624          crystalfreq = chipco_read32(cc, SSB_CHIPCO_PMU_CTL) &
   625                        SSB_CHIPCO_PMU_CTL_XTALFREQ >> SSB_CHIPCO_PMU_CTL_XTALFREQ_SHIFT;

This was probably supposed to be:

		crystalfreq = (chipco_read32(cc, SSB_CHIPCO_PMU_CTL) &
			       SSB_CHIPCO_PMU_CTL_XTALFREQ) >> SSB_CHIPCO_PMU_CTL_XTALFREQ_SHIFT;

   626          e = pmu0_plltab_find_entry(crystalfreq);
   627          BUG_ON(!e);
   628          return e->freq * 1000;
   629  }

regards,
dan carpenter
