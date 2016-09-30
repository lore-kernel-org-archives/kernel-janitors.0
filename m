From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Sep 2016 11:44:37 +0000
Subject: [bug report] qed*: Add support for VFs over legacy PFs
Message-Id: <20160930114436.GA12102@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Yuval Mintz,

The patch d8c2c7e3404e: "qed*: Add support for VFs over legacy PFs"
from Aug 22, 2016, leads to the following static checker warning:

	drivers/net/ethernet/qlogic/qed/qed_vf.c:297 qed_vf_pf_acquire()
	warn: should this be a bitwise op?

drivers/net/ethernet/qlogic/qed/qed_vf.c
   289          /* Learn of the possibility of CMT */
   290          if (IS_LEAD_HWFN(p_hwfn)) {
   291                  if (resp->pfdev_info.capabilities & PFVF_ACQUIRE_CAP_100G) {
   292                          DP_NOTICE(p_hwfn, "100g VF\n");
   293                          p_hwfn->cdev->num_hwfns = 2;
   294                  }
   295          }
   296  
   297          if (!p_iov->b_pre_fp_hsi &&
   298              ETH_HSI_VER_MINOR &&
   299              (resp->pfdev_info.minor_fp_hsi < ETH_HSI_VER_MINOR)) {

It looks like this code works correctly.  I think the ETH_HSI_VER_MINOR
check is to silence a static checker warning because otherwise we are
occasionally comparing an unsigned with less than zero?  (Although I
think most static checkers will still complain so maybe that's not
true?).  Anyway, it's weird code.

It would probably be more clear to say "ETH_HSI_VER_MINOR > 0 &&".
When we're talking about comparisons to zero then it's idiomatic to use
"foo != 0" if we're talking about the number zero or strcmp() functions.
If it's used as a bool then we would say "!foo"...

   300                  DP_INFO(p_hwfn,
   301                          "PF is using older fastpath HSI; %02x.%02x is configured\n",
   302                          ETH_HSI_VER_MAJOR, resp->pfdev_info.minor_fp_hsi);
   303          }
   304  
   305  exit:
   306          qed_vf_pf_req_end(p_hwfn, rc);
   307  
   308          return rc;

regards,
dan carpenter
