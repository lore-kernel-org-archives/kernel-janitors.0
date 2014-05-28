From: Borislav Petkov <bp@alien8.de>
Date: Wed, 28 May 2014 09:52:27 +0000
Subject: Re: [PATCH v3] x86/mce: Improve mcheck_init_device() error handling
Message-Id: <20140528095227.GA17196@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401261157-1165-1-git-send-email-mattieu.souchaud@free.fr>
In-Reply-To: <1401261157-1165-1-git-send-email-mattieu.souchaud@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Souchaud <mattieu.souchaud@free.fr>
Cc: tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, May 28, 2014 at 09:12:37AM +0200, Mathieu Souchaud wrote:
> Check return code of every function called by mcheck_init_device().
> 
> Signed-off-by: Mathieu Souchaud <mattieu.souchaud@free.fr>

Applied, thanks!

I'll queue it for 3.17 though since we're very close to the 3.16 merge
window and this patch hasn't had any linux-next time.

Thanks for your good work, let me know if you want to do more around mce.

:-)

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
