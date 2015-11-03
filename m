From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 03 Nov 2015 14:26:23 +0000
Subject: re: openvswitch: Fix egress tunnel info.
Message-Id: <20151103142623.GD28591@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Pravin B Shelar,

This is a semi-automatic email about new static checker warnings.

The patch fc4099f17240: "openvswitch: Fix egress tunnel info." from 
Oct 22, 2015, leads to the following Smatch complaint:

include/net/dst_metadata.h:69 tun_dst_unclone()
	 warn: variable dereferenced before check 'md_dst' (see line 66)

include/net/dst_metadata.h
    65		struct metadata_dst *md_dst = skb_metadata_dst(skb);
    66		int md_size = md_dst->u.tun_info.options_len;
                              ^^^^^^^^
New dereference.

    67		struct metadata_dst *new_md;
    68	
    69		if (!md_dst)
                    ^^^^^^^
New NULL check.

    70			return ERR_PTR(-EINVAL);
    71	

regards,
dan carpenter
