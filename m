From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 01 Aug 2019 08:03:43 +0000
Subject: Re: [PATCH] cifs: remove redundant assignment to variable rc
Message-Id: <20190801080343.GA1935@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190731090526.27245-1-colin.king@canonical.com>
 <87r266seg4.fsf@suse.com>
 <20190731122841.GA1974@kadam>
 <87lfwerze8.fsf@suse.com>
In-Reply-To: <87lfwerze8.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?iso-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>
Cc: Colin King <colin.king@canonical.com>, samba-technical@lists.samba.org, Steve French <sfrench@samba.org>, kernel-janitors@vger.kernel.org, linux-cifs@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 31, 2019 at 05:34:39PM +0200, Aur=E9lien Aptel wrote:
> "Dan Carpenter" <dan.carpenter@oracle.com> writes:
> > You're just turning off GCC's static analysis (and introducing false
> > positives) when you do that.  We have seen bugs caused by this and never
> > seen any bugs prevented by this style.
>=20
> You've never seen bugs prevented by initializing uninitialized
> variables? Code can change overtime and I don't think coverity is
> checked as often as it could be, meaning the var could end up being used
> while uninitialized in the future.

Of course, we wouldn't see bugs that were prevented so that wasn't
entirely fair.

There is a several year old bug in GCC where it sometimes initializes
these to zero and doesn't warn about the uninitialized variable so it
is actually possible to prevent a bug by initializing it to an error
code.

Smatch also warns about uninitialized variables.  I normally run Smatch
on linux-next every day but I have been out of office for the past
month and my config doesn't cover everything.

We haven't been able to enable this "redundant assignment" warning
because of all the false positives like this.  It mostly finds dead code
but it also does find some bugs where we forget to check the error code
or we use the wrong variable.

regards,
dan carpenter
