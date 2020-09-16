From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Wed, 16 Sep 2020 07:20:29 +0000
Subject: Re: [PATCH] vboxsf: fix comparison of signed char constant with unsigned char array elements
Message-Id: <CA+icZUVx8=6H4MrzPKWLc-xsFveuB-9JtzfnH=VpnwWg7mPjtQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200915160336.36107-1-colin.king@canonical.com> <65fbb23b-a533-aedb-75eb-69e1c53eaae9@redhat.com>
In-Reply-To: <65fbb23b-a533-aedb-75eb-69e1c53eaae9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans de Goede <hdegoede@redhat.com>
Cc: Colin King <colin.king@canonical.com>, Christoph Hellwig <hch@infradead.org>, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, Sep 16, 2020 at 8:16 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 9/15/20 6:03 PM, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > The comparison of signed char constants with unsigned char array
> > elements leads to checks that are always false. Fix this by declaring
> > the VBSF_MOUNT_SIGNATURE_BYTE* macros as octal unsigned int constants
> > rather than as signed char constants. (Argueably the U is not necessarily
> > required, but add it to be really clear of intent).
> >
> > Addresses-Coverity: ("Operands don't affect result")
> > Fixes: 0fd169576648 ("fs: Add VirtualBox guest shared folder (vboxsf) support")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
>
> A fix for this has already been queued up:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/log/?h=fixes
>
> Explicit nack for this one, since it will still apply, but combined
> with the other fix, it will re-break things.
>

Hans, your patch is from 2020-08-25 and in a "fixes" Git branch of vfs
- why wasn't it applied to Linux 5.9?

- Sedat -

> Regards,
>
> Hans
>
>
>
> > ---
> >   fs/vboxsf/super.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/fs/vboxsf/super.c b/fs/vboxsf/super.c
> > index 25aade344192..986efcb29cc2 100644
> > --- a/fs/vboxsf/super.c
> > +++ b/fs/vboxsf/super.c
> > @@ -21,10 +21,10 @@
> >
> >   #define VBOXSF_SUPER_MAGIC 0x786f4256 /* 'VBox' little endian */
> >
> > -#define VBSF_MOUNT_SIGNATURE_BYTE_0 ('\000')
> > -#define VBSF_MOUNT_SIGNATURE_BYTE_1 ('\377')
> > -#define VBSF_MOUNT_SIGNATURE_BYTE_2 ('\376')
> > -#define VBSF_MOUNT_SIGNATURE_BYTE_3 ('\375')
> > +#define VBSF_MOUNT_SIGNATURE_BYTE_0 0000U
> > +#define VBSF_MOUNT_SIGNATURE_BYTE_1 0377U
> > +#define VBSF_MOUNT_SIGNATURE_BYTE_2 0376U
> > +#define VBSF_MOUNT_SIGNATURE_BYTE_3 0375U
> >
> >   static int follow_symlinks;
> >   module_param(follow_symlinks, int, 0444);
> >
>
