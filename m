From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 18 Mar 2017 04:14:22 +0000
Subject: Re: dm crypt: remove an impossible condition
Message-Id: <20170318041422.GC4102@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170317204655.GA28261@mwanda> <20170317213819.GC6475@redhat.com>
In-Reply-To: <20170317213819.GC6475@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Mike Snitzer <snitzer@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-raid@vger.kernel.org, dm-devel@redhat.com, Shaohua Li <shli@kernel.org>, Milan Broz <gmazyland@gmail.com>, Alasdair Kergon <agk@redhat.com>

On Fri, Mar 17, 2017 at 05:38:19PM -0400, Mike Snitzer wrote:
> On Fri, Mar 17 2017 at  4:46pm -0400,
> Dan Carpenter <dan.carpenter@oracle.com> wrote:
>=20
> > Static checkers complain that it doesn't make sense to check if "sval"
> > is NULL.  The intention was to check if strchr() returned NULL, but in
> > that situation "sval" would be "NULL + 1" so the check doesn't work.  We
> > know from the sscanf() that there is a ':' character in the string so
> > the check is unnecessary and can be removed.
> >=20
> > Now that the check doesn't depend on "sval" it can be moved earlier
> > for readability.
> >=20
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> Thanks Dan, I've folded this fix into the original commit, see:
> https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.gi=
t/commit/?h=3Ddm-4.12&id=CF22cd5f3afe7335afee5659f7450000e8fa2a15
>=20
> I didn't add your Signed-off-by though, I can backfill that if you
> like.. it is just I didn't want to taint you with all the extensive
> changes in that commit.

That's fine, thanks.  Sign-off isn't really the appropriate tag anyway...

regards,
dan carpenter

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
