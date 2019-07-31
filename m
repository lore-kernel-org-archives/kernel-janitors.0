From: =?utf-8?Q?Aur=C3=A9lien?= Aptel <aaptel@suse.com>
Date: Wed, 31 Jul 2019 15:34:39 +0000
Subject: Re: [PATCH] cifs: remove redundant assignment to variable rc
Message-Id: <87lfwerze8.fsf@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190731090526.27245-1-colin.king@canonical.com> <87r266seg4.fsf@suse.com> <20190731122841.GA1974@kadam>
In-Reply-To: <20190731122841.GA1974@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Colin King <colin.king@canonical.com>, samba-technical@lists.samba.org, Steve French <sfrench@samba.org>, kernel-janitors@vger.kernel.org, linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org

"Dan Carpenter" <dan.carpenter@oracle.com> writes:
> You're just turning off GCC's static analysis (and introducing false
> positives) when you do that.  We have seen bugs caused by this and never
> seen any bugs prevented by this style.

You've never seen bugs prevented by initializing uninitialized
variables? Code can change overtime and I don't think coverity is
checked as often as it could be, meaning the var could end up being used
while uninitialized in the future.

Anyway I won't die on this hill, merge this if you prefer.

Cheers,
-- 
Aurélien Aptel / SUSE Labs Samba Team
GPG: 1839 CB5F 9F5B FB9B AA97  8C99 03C8 A49B 521B D5D3
SUSE Linux GmbH, Maxfeldstraße 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah HRB 21284 (AG Nürnberg)
