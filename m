From: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Date: Wed, 31 Jul 2019 10:09:31 +0000
Subject: Re: [PATCH] cifs: remove redundant assignment to variable rc
Message-Id: <87r266seg4.fsf@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190731090526.27245-1-colin.king@canonical.com>
In-Reply-To: <20190731090526.27245-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, samba-technical@lists.samba.org, Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> writes:
> Variable rc is being initialized with a value that is never read
> and rc is being re-assigned a little later on. The assignment is
> redundant and hence can be removed.

I think I would actually rather have rc set to an error by default than
uninitialized. Just my personal opinion.

Cheers,
-- 
Aurélien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Linux GmbH, Maxfeldstraße 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah HRB 21284 (AG Nürnberg)
