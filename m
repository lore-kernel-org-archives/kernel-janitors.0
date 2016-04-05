From: Alexandre Torgue <alexandre.torgue@st.com>
Date: Tue, 05 Apr 2016 09:24:06 +0000
Subject: Re: stmmac: add descriptors function for GMAC 4.xx
Message-Id: <57038436.8060004@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160404204609.GA9128@mwanda>
In-Reply-To: <20160404204609.GA9128@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Dan,

On 04/04/2016 10:46 PM, Dan Carpenter wrote:
> Hello Alexandre TORGUE,
>
> The patch 753a71090f33: "stmmac: add descriptors function for GMAC
> 4.xx" from Apr 1, 2016, leads to the following static checker warning:
>
> 	drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c:261 dwmac4_rd_prepare_tx_desc()
> 	warn: odd binop '0x4000 & 0x3fff'
>
> drivers/net/ethernet/stmicro/stmmac/dwmac4_descs.c
>     251  static void dwmac4_rd_prepare_tx_desc(struct dma_desc *p, int is_fs, int len,
>     252                                        bool csum_flag, int mode, bool tx_own,
>     253                                        bool ls)
>     254  {
>     255          unsigned int tdes3 = p->des3;
>     256
>     257          if (unlikely(len > BUF_SIZE_16KiB)) {
>     258                  p->des2 |= (((len - BUF_SIZE_16KiB) <<
>     259                               TDES2_BUFFER2_SIZE_MASK_SHIFT)
>     260                              & TDES2_BUFFER2_SIZE_MASK)
>     261                              | (BUF_SIZE_16KiB & TDES2_BUFFER1_SIZE_MASK);
>                                         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Should this be "len & TDES2_BUFFER1_SIZE_MASK" or are you rounding down
> the length deliberately?

It is a mistake. Could be "len & TDES2_BUFFER1_SIZE_MASK" or 
"(BUF_SIZE_16KiB - 1) & TDES2_BUFFER1_SIZE_MASK".
I will send a fix.

Thanks.

regards,

Alex

>
>     262          } else {
>     263                  p->des2 |= (len & TDES2_BUFFER1_SIZE_MASK);
>     264          }
>     265
>     266          if (is_fs)
>     267                  tdes3 |= TDES3_FIRST_DESCRIPTOR;
>     268          else
>     269                  tdes3 &= ~TDES3_FIRST_DESCRIPTOR;
>     270
>
> regards,
> dan carpenter
>


