From: Bing Zhao <bzhao@marvell.com>
Date: Thu, 26 Sep 2013 20:57:32 +0000
Subject: RE: [patch] mwifiex: potential integer underflow in mwifiex_ret_wmm_get_status()
Message-Id: <477F20668A386D41ADCC57781B1F70430F45078155@SC-VEXCH1.marvell.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130925085729.GC6661@elgon.mountain>
 <477F20668A386D41ADCC57781B1F70430F45077CDA@SC-VEXCH1.marvell.com>
 <20130925182359.GV6247@mwanda>
 <477F20668A386D41ADCC57781B1F70430F45077E52@SC-VEXCH1.marvell.com>
In-Reply-To: <477F20668A386D41ADCC57781B1F70430F45077E52@SC-VEXCH1.marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi Dan,

> > No, that doesn't work because the comparison against sizeof() get's
> > promoted to size_t.  In other words, negative values still count as
> > large positive values.
> 
> You are right. The negative value counts as a large positive number while comparing against sizeof().
> I can add a "const int hdr_size" variable to store the value of sizeof(...) and compare resp_len to
> hdr_size. The "sizeof(...)" has been used multiple times in this function, so I think it's worth
> adding a variable for it.

Well, there is another problem here.
We might have accessed invalid memory while handling switch case in last iteration, because we didn't count tlv_len in "while(...)" condition check.

To fix this, Dan's change makes sense. But we should check the length before accessing the buffer.

@@ -722,6 +722,9 @@ int mwifiex_ret_wmm_get_status(struct mwifiex_private *priv,
 		tlv_hdr = (struct mwifiex_ie_types_data *) curr;
 		tlv_len = le16_to_cpu(tlv_hdr->header.len);
 
+		if (resp_len < tlv_len + sizeof(tlv_hdr->header))
+			break;
+
 		switch (le16_to_cpu(tlv_hdr->header.type)) {
 		case TLV_TYPE_WMMQSTATUS:
 			tlv_wmm_qstatus 
Thanks,
Bing

