From: Mark Greer <mgreer@animalcreek.com>
Date: Fri, 28 Apr 2017 00:28:42 +0000
Subject: Re: [PATCH v4] NFC: trf7970a: Correct register settings for 27MHz clock
Message-Id: <20170428002842.GA26631@animalcreek.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1493328526-28395-1-git-send-email-geoff@kuvee.com>
In-Reply-To: <1493328526-28395-1-git-send-email-geoff-R+k406RtEhcAvxtiuMwx3w@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geoff Lansberry <geoff-R+k406RtEhcAvxtiuMwx3w@public.gmane.org>
Cc: linux-wireless-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-nfc-hn68Rpc1hR1g9hUCZPvPmw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mgreer-luAo+O/VEmrlveNOaEYElw@public.gmane.org, justin-R+k406RtEhcAvxtiuMwx3w@public.gmane.org, colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, wharms-fPG8STNUNVg@public.gmane.org

On Thu, Apr 27, 2017 at 05:28:46PM -0400, Geoff Lansberry wrote:
> In prior commits the selected clock frequency does not propagate
> correctly to what is written to the TRF7970A_MODULATOR_SYS_CLK_CTRL
> register.
> 
> Signed-off-by: Geoff Lansberry <geoff@kuvee.com>
> ---

Acked-by: Mark Greer <mgreer@animalcreek.com>
