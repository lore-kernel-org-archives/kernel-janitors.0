From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 31 Jul 2019 12:28:41 +0000
Subject: Re: [PATCH] cifs: remove redundant assignment to variable rc
Message-Id: <20190731122841.GA1974@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190731090526.27245-1-colin.king@canonical.com>
 <87r266seg4.fsf@suse.com>
In-Reply-To: <87r266seg4.fsf@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?iso-8859-1?Q?Aur=E9lien?= Aptel <aaptel@suse.com>
Cc: Colin King <colin.king@canonical.com>, samba-technical@lists.samba.org, Steve French <sfrench@samba.org>, linux-cifs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Jul 31, 2019 at 12:09:31PM +0200, Aur=E9lien Aptel wrote:
> Colin King <colin.king@canonical.com> writes:
> > Variable rc is being initialized with a value that is never read
> > and rc is being re-assigned a little later on. The assignment is
> > redundant and hence can be removed.
>=20
> I think I would actually rather have rc set to an error by default than
> uninitialized. Just my personal opinion.

You're just turning off GCC's static analysis (and introducing false
positives) when you do that.  We have seen bugs caused by this and never
seen any bugs prevented by this style.

regards,
dan carpenter
