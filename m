From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Jun 2012 18:21:17 +0000
Subject: Re: [Q] Cleaning string whitespace trimming. Does it make any sense?
Message-Id: <20120613182117.GU13539@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
In-Reply-To: <CALF0-+V15wjFhZH5P1C+4sJ9QSw7QY5Rk383S4XhVVCBsnXUQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Wed, Jun 13, 2012 at 03:16:24PM -0300, Ezequiel Garcia wrote:
> Dan,
>=20
> On Tue, Jun 12, 2012 at 5:58 PM, Dan Carpenter <dan.carpenter@oracle.com>=
 wrote:
> > Actually, on second thought strim() already does what we want. =A0Just
> > ignore the return value.
> >
>=20
> If I *only* want to remove trailing whitespace, using strim() does the job
> but it *also* tries to remove leading whitespace.
>=20
> That can't hurt, but it also doesn't hurt to add a separate function
> for that, right?

It returns a pointer to the first non whitespace character, but you
can just ignore the return value.  Normally the first character is
going to be non whitespace, so it's not even a slow down.

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
