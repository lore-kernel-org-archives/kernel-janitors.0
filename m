From: Eric Paris <eparis@parisplace.org>
Date: Tue, 08 Jun 2010 20:00:26 +0000
Subject: Re: [patch 1/7] selinux: cleanup return codes in avtab_read_item()
Message-Id: <AANLkTimZ48MAeEGoCwu3cWFTBofb-OUw6tBKQ7wSsJ4X@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100607210217.GQ5483@bicker>
In-Reply-To: <20100607210217.GQ5483@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Mon, Jun 7, 2010 at 5:02 PM, Dan Carpenter <error27@gmail.com> wrote:
> The avtab_read_item() function tends to return -1 as a default error
> code which is wrong (-1 means -EPERM). =A0I modified it to return
> appropriate error codes which is -EINVAL or the error code from
> next_entry() or insertf().
>
> next_entry() returns -EINVAL.
> insertf() is a function pointer to either avtab_insert() or
> cond_insertf().
> avtab_insert() returns -EINVAL, -ENOMEM, and -EEXIST.
> cond_insertf() currently returns -1, but I will fix it in a later patch.
>
> There is code in avtab_read() which translates the -1 returns from
> avtab_read_item() to -EINVAL. The translation is no longer needed, so I
> removed it.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>

I did these same patches a month ago and they were pretty much
completely ignored.  Glad to see someone else is trying again.

Acked-by: Eric Paris <eparis@redhat.com>

> diff --git a/security/selinux/ss/avtab.c b/security/selinux/ss/avtab.c
> index 1215b8e..fe62d82 100644
> --- a/security/selinux/ss/avtab.c
> +++ b/security/selinux/ss/avtab.c
> @@ -344,18 +344,18 @@ int avtab_read_item(struct avtab *a, void *fp, stru=
ct policydb *pol,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rc =3D next_entry(buf32, fp, sizeof(u32));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (rc < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: =
avtab: truncated entry\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return rc;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0items2 =3D le32_to_cpu(buf32[0]);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (items2 > ARRAY_SIZE(buf32)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: =
avtab: entry overflow\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rc =3D next_entry(buf32, fp, sizeof(u32)*i=
tems2);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (rc < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: =
avtab: truncated entry\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return rc;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0items =3D 0;
>
> @@ -363,19 +363,19 @@ int avtab_read_item(struct avtab *a, void *fp, stru=
ct policydb *pol,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0key.source_type =3D (u16)val;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (key.source_type !=3D val) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: =
avtab: truncated source type\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0val =3D le32_to_cpu(buf32[items++]);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0key.target_type =3D (u16)val;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (key.target_type !=3D val) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: =
avtab: truncated target type\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0val =3D le32_to_cpu(buf32[items++]);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0key.target_class =3D (u16)val;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (key.target_class !=3D val) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: =
avtab: truncated target class\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0val =3D le32_to_cpu(buf32[items++]);
> @@ -383,12 +383,12 @@ int avtab_read_item(struct avtab *a, void *fp, stru=
ct policydb *pol,
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (!(val & (AVTAB_AV | AVTAB_TYPE))) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: =
avtab: null entry\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((val & AVTAB_AV) &&
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(val & AVTAB_TYPE)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: =
avtab: entry has both access vectors and types\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < ARRAY_SIZE(spec_order); =
i++) {
> @@ -403,7 +403,7 @@ int avtab_read_item(struct avtab *a, void *fp, struct=
 policydb *pol,
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (items !=3D items2) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: =
avtab: entry only had %d items, expected %d\n", items2, items);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> =A0 =A0 =A0 =A0}
> @@ -411,7 +411,7 @@ int avtab_read_item(struct avtab *a, void *fp, struct=
 policydb *pol,
> =A0 =A0 =A0 =A0rc =3D next_entry(buf16, fp, sizeof(u16)*4);
> =A0 =A0 =A0 =A0if (rc < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: avtab: truncated=
 entry\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return rc;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0items =3D 0;
> @@ -424,7 +424,7 @@ int avtab_read_item(struct avtab *a, void *fp, struct=
 policydb *pol,
> =A0 =A0 =A0 =A0 =A0 =A0!policydb_type_isvalid(pol, key.target_type) ||
> =A0 =A0 =A0 =A0 =A0 =A0!policydb_class_isvalid(pol, key.target_class)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: avtab: invalid t=
ype or class\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0set =3D 0;
> @@ -434,19 +434,19 @@ int avtab_read_item(struct avtab *a, void *fp, stru=
ct policydb *pol,
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0if (!set || set > 1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: =A0avtab: =A0mor=
e than one specifier\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0rc =3D next_entry(buf32, fp, sizeof(u32));
> =A0 =A0 =A0 =A0if (rc < 0) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: avtab: truncated=
 entry\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return rc;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0datum.data =3D le32_to_cpu(*buf32);
> =A0 =A0 =A0 =A0if ((key.specified & AVTAB_TYPE) &&
> =A0 =A0 =A0 =A0 =A0 =A0!policydb_type_isvalid(pol, datum.data)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "SELinux: avtab: invalid t=
ype\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0return insertf(a, &key, &datum, p);
> =A0}
> @@ -487,8 +487,7 @@ int avtab_read(struct avtab *a, void *fp, struct poli=
cydb *pol)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KER=
N_ERR "SELinux: avtab: out of memory\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else if (rc =3D -EEXIST)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KER=
N_ERR "SELinux: avtab: duplicate entry\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rc =3D -EIN=
VAL;
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto bad;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
> --
> To unsubscribe from this list: send the line "unsubscribe linux-security-=
module" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
