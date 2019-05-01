From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 01 May 2019 15:25:53 +0000
Subject: Re: [PATCH] brcm80211: potential NULL dereference in brcmf_cfg80211_vndr_cmds_dcmd_handler()
Message-Id: <20190501152553.5D75960735@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190424095218.GB16450@mwanda>
In-Reply-To: <20190424095218.GB16450@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>, Franky Lin <franky.lin@broadcom.com>, Hante Meuleman <hante.meuleman@broadcom.com>, Chi-Hsien Lin <chi-hsien.lin@cypress.com>, Wright Feng <wright.feng@cypress.com>, linux-wireless@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com, brcm80211-dev-list@cypress.com, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> If "ret_len" is negative then it could lead to a NULL dereference.
> 
> The "ret_len" value comes from nl80211_vendor_cmd(), if it's negative
> then we don't allocate the "dcmd_buf" buffer.  Then we pass "ret_len" to
> brcmf_fil_cmd_data_set() where it is cast to a very high u32 value.
> Most of the functions in that call tree check whether the buffer we pass
> is NULL but there are at least a couple places which don't such as
> brcmf_dbg_hex_dump() and brcmf_msgbuf_query_dcmd().  We memcpy() to and
> from the buffer so it would result in a NULL dereference.
> 
> The fix is to change the types so that "ret_len" can't be negative.  (If
> we memcpy() zero bytes to NULL, that's a no-op and doesn't cause an
> issue).
> 
> Fixes: 1bacb0487d0e ("brcmfmac: replace cfg80211 testmode with vendor command")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Patch applied to wireless-drivers-next.git, thanks.

e025da3d7aa4 brcm80211: potential NULL dereference in brcmf_cfg80211_vndr_cmds_dcmd_handler()

-- 
https://patchwork.kernel.org/patch/10914427/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
