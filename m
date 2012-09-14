From: "Arend van Spriel" <arend@broadcom.com>
Date: Fri, 14 Sep 2012 16:00:44 +0000
Subject: Re: [iwlwifi:master 67/70] drivers/net/wireless/brcm80211/brcmfmac/wl_cfg80211.c:732:42: sparse:
Message-Id: <505354AC.7040108@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120914144351.GA23614@localhost>
In-Reply-To: <20120914144351.GA23614@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: Hante Meuleman <meuleman@broadcom.com>, kernel-janitors@vger.kernel.org, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org

On 09/14/2012 04:43 PM, Fengguang Wu wrote:
> Hi Hante,
>
> FYI, there are new sparse warnings show up in
>
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi.git master
> head:   99f314c04ff5f4cfd969f5fbe82d6d0c0a7d8336
> commit: e756af5b30b008f6ffcfebf8ad0b477f6f225b62 [67/70] brcmfmac: add e-scan support.
>
> All sparse warnings:

Thanks, Fengguang

I was doing 'make C=2' today and noticed these warnings as well. Already 
patching it.

Regards,
Arend

