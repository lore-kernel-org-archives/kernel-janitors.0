From: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Date: Tue, 22 Nov 2016 12:18:25 +0000
Subject: Re: [PATCH] SMB2: Fix share type handling
Message-Id: <mpspolnn1wu.fsf@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161121215352.3183-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161121215352.3183-1-christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>, sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org
Cc: linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:
> Knowing that, with the current code, the SMB2_SHARE_TYPE_PRINT case can
> never trigger and printer share would be interpreted as disk share.

I've checked the SMB2 specs ([MS-SMB2] 3.2.5.5), I can confirm these are
the 3 only options. No upper bits are supposed to be set.

> So, test the ShareType value for equality instead.
>
> While at it, add some { } to fix a small style issue.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile-tested only.
>
> The proposed patch changes a bit the semantic as no masking is performed
> anymore. If some upper bits in 'ShareType' are set, it would now be rejected
> instead of silently accepted.

The semantic change is correct. I also think a switch would be more
appropriate. Beside this, Looks Good To Me.

-- 
Aurélien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Linux GmbH, Maxfeldstraße 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton, HRB 21284 (AG Nürnberg)
