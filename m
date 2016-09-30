From: "Mintz, Yuval" <Yuval.Mintz@cavium.com>
Date: Fri, 30 Sep 2016 12:05:16 +0000
Subject: RE: [bug report] qed*: Add support for VFs over legacy PFs
Message-Id: <BL2PR07MB2306853ADE5558CCE4C7094C8DC10@BL2PR07MB2306.namprd07.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160930114436.GA12102@mwanda>
In-Reply-To: <20160930114436.GA12102@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> The patch d8c2c7e3404e: "qed*: Add support for VFs over legacy PFs"
> from Aug 22, 2016, leads to the following static checker warning:
> 
> 	drivers/net/ethernet/qlogic/qed/qed_vf.c:297 qed_vf_pf_acquire()
> 	warn: should this be a bitwise op?
> 
> drivers/net/ethernet/qlogic/qed/qed_vf.c
>    289          /* Learn of the possibility of CMT */
>    290          if (IS_LEAD_HWFN(p_hwfn)) {
>    291                  if (resp->pfdev_info.capabilities & PFVF_ACQUIRE_CAP_100G) {
>    292                          DP_NOTICE(p_hwfn, "100g VF\n");
>    293                          p_hwfn->cdev->num_hwfns = 2;
>    294                  }
>    295          }
>    296
>    297          if (!p_iov->b_pre_fp_hsi &&
>    298              ETH_HSI_VER_MINOR &&
>    299              (resp->pfdev_info.minor_fp_hsi < ETH_HSI_VER_MINOR)) {
> 
> It looks like this code works correctly.  I think the ETH_HSI_VER_MINOR check is
> to silence a static checker warning because otherwise we are occasionally
> comparing an unsigned with less than zero?  (Although I think most static
> checkers will still complain so maybe that's not true?).  Anyway, it's weird code.
> 
> It would probably be more clear to say "ETH_HSI_VER_MINOR > 0 &&".

Can't say I recall the exact rational here, but I think you're right.
Given that initially when this was submitted the fastpath HSI version was 3.0
[currently its 3.10], it makes sense that I've added this exactly due to the reason you're describing.

And I agrees that doing "> 0" is clearer.

Thanks,
Yuval

