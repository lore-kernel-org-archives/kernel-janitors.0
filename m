From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Mar 2020 12:16:42 +0000
Subject: Re: [PATCH] perf cpumap: Use scnprintf instead of snprintf
Message-Id: <20200323121642.GC4672@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200322172523.2677-1-christophe.jaillet@wanadoo.fr>
 <20200323110334.GC26299@kadam>
 <9f8351f9-7664-8c96-9c37-a6e86efc9643@wanadoo.fr>
In-Reply-To: <9f8351f9-7664-8c96-9c37-a6e86efc9643@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: peterz@infradead.org, mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, jolsa@redhat.com, namhyung@kernel.org, kan.liang@linux.intel.com, zhe.he@windriver.com, dzickus@redhat.com, jstancek@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Mar 23, 2020 at 01:08:47PM +0100, Christophe JAILLET wrote:
> Le 23/03/2020 =E0 12:03, Dan Carpenter a =E9crit=A0:
> > On Sun, Mar 22, 2020 at 06:25:23PM +0100, Christophe JAILLET wrote:
> > > 'scnprintf' returns the number of characters written in the output bu=
ffer
> > > excluding the trailing '\0', instead of the number of characters which
> > > would be generated for the given input.
> > >=20
> > > Both function return a number of characters, excluding the trailing '=
\0'.
> > > So comparaison to check if it overflows, should be done against max_s=
ize-1.
> > > Comparaison against max_size can never match.
> > >=20
> > > Fixes: 7780c25bae59f ("perf tools: Allow ability to map cpus to nodes=
 easily")
> > > Fixes: a24020e6b7cf6 ("perf tools: Change cpu_map__fprintf output")
> > > Fixes: 92a7e1278005b ("perf cpumap: Add cpu__max_present_cpu()")
> > > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> > > ---
> > >   tools/perf/util/cpumap.c | 39 ++++++++++++++++++++-----------------=
--
> > >   1 file changed, 20 insertions(+), 19 deletions(-)
> > >=20
> > > diff --git a/tools/perf/util/cpumap.c b/tools/perf/util/cpumap.c
> > > index 983b7388f22b..b87e7ef4d130 100644
> > > --- a/tools/perf/util/cpumap.c
> > > +++ b/tools/perf/util/cpumap.c
> > > @@ -316,8 +316,8 @@ static void set_max_cpu_num(void)
> > >   		goto out;
> > >   	/* get the highest possible cpu number for a sparse allocation */
> > > -	ret =3D snprintf(path, PATH_MAX, "%s/devices/system/cpu/possible", =
mnt);
> > > -	if (ret =3D PATH_MAX) {
> > > +	ret =3D scnprintf(path, PATH_MAX, "%s/devices/system/cpu/possible",=
 mnt);
> > > +	if (ret =3D PATH_MAX-1) {
> > This should be a static analysis warning.
> >=20
> > But isn't this stuff userspace?  I can't figure out how to compile it on
> > Debian so I'm not sure.  There is no scnprintf() in user space.
> >=20
> > regards,
> > dan carpenter
>=20
> I compiled it with:
>=20
> =A0=A0=A0 make tools/perf
>=20

Ah.  You're absolutely right.  My bad.  Sorry for that.

I was doing "cd tools/perf; make" and it told me to install glibc-dev.

regards,
dan carpenter
