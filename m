From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Nov 2016 12:49:41 +0000
Subject: [bug report] vxlan: keep flags and vni in network byte order
Message-Id: <20161111124941.GA3991@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Jiri Benc,

The patch 54bfd872bf16: "vxlan: keep flags and vni in network byte
order" from Feb 16, 2016, leads to the following static checker
warning:

	./include/net/vxlan.h:340 vxlan_vni()
	warn: potential shift truncation.  '0xffffff00 << 8'

include/net/vxlan.h
   335  static inline __be32 vxlan_vni(__be32 vni_field)
   336  {
   337  #if defined(__BIG_ENDIAN)
   338          return (__force __be32)((__force u32)vni_field >> 8);
   339  #else
   340          return (__force __be32)((__force u32)(vni_field & VXLAN_VNI_MASK) << 8);

Are you sure this is correct?  VXLAN_VNI_MASK already has an << 8 shift
so this feels like maybe it is a double shift.

   341  #endif
   342  }

regards,
dan carpenter
