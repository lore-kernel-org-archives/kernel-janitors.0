From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Nov 2016 09:56:13 +0000
Subject: [bug report] genetlink: fix error return code in genl_register_family()
Message-Id: <20161109095613.GA24471@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Wei Yongjun,

The patch 22ca904ad70a: "genetlink: fix error return code in
genl_register_family()" from Nov 1, 2016, leads to the following
static checker warning:

	net/netlink/genetlink.c:365 genl_register_family()
	warn: unsigned 'family->id' is never less than zero.

net/netlink/genetlink.c
   362  
   363          family->id = idr_alloc(&genl_fam_idr, family,
   364                                 start, end + 1, GFP_KERNEL);
   365          if (family->id < 0) {
                    ^^^^^^^^^^^^^^
Doesn't work for unsigned int.

   366                  err = family->id;
   367                  goto errout_free;
   368          }
   369  

regards,
dan carpenter
