From: "=?UTF-8?Q?H=C3=A5kon_L=C3=B8vdal?=" <hlovdal@gmail.com>
Date: Mon, 26 Feb 2007 12:57:49 +0000
Subject: Re: [KJ] another potential project: using sysfs ATTR macros.
Message-Id: <a01a16b50702260457g5a993a8ftff494b9606a18a4e@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On 25/02/07, Greg KH <greg@kroah.com> wrote:> On Sun, Feb 25, 2007 at 02:46=
:12PM -0500, Robert P. J. Day wrote:> > #define __ATTR_RO(_name) { \> >    =
     .attr   =3D { .name =3D __stringify(_name), .mode =3D 0444, .owner =3D=
 THIS_MODULE },   \> >         .show   =3D _name##_show, \> > }...> >   the=
 downside to this is that you can see that the __ATTR_RO macro> > expects a=
 definite naming convention -- the "show" routine *must* be> > named "_name=
##_show".  in cases where that's not true, you're> > obviously screwed and =
you can't use that macro.  otherwise, you could> > have used *that* for thi=
s very same example.  grrrrrrrrrrrrrr.>> Any idea how to fix that in a sane=
 manner?
The preprocessor can be used for this:
static ssize_t show_whatever(struct class_device *class_device, char *buf){=
	...}...#define whatever_show show_whatever
static struct class_device_attribute class_device_attrs[] =3D {	__ATTR_RO(w=
hatever),};
BR H=E5kon L=F8vdal
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
