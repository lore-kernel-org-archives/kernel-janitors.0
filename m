From: mathieu souchaud <mattieu.souchaud@free.fr>
Date: Wed, 28 May 2014 20:50:02 +0000
Subject: Re: [PATCH v3] x86/mce: Improve mcheck_init_device() error handling
Message-Id: <53864BFA.6070103@free.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401261157-1165-1-git-send-email-mattieu.souchaud@free.fr> <20140528095227.GA17196@pd.tnic>
In-Reply-To: <20140528095227.GA17196@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks too, you helped me a lot.

I can do more work, if it's not too difficult for me.

Mathieu

Le 28/05/2014 11:52, Borislav Petkov a =C3=A9crit :
> On Wed, May 28, 2014 at 09:12:37AM +0200, Mathieu Souchaud wrote:
>> Check return code of every function called by mcheck_init_device().
>>
>> Signed-off-by: Mathieu Souchaud <mattieu.souchaud@free.fr>
> Applied, thanks!
>
> I'll queue it for 3.17 though since we're very close to the 3.16 merge
> window and this patch hasn't had any linux-next time.
>
> Thanks for your good work, let me know if you want to do more around mce.
>
> :-)
>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
