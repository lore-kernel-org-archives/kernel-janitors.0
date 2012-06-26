From: santosh prasad nayak <santoshprasadnayak@gmail.com>
Date: Tue, 26 Jun 2012 01:33:39 +0000
Subject: Re: [patch v2] Btrfs: fix error handling in __add_reloc_root()
Message-Id: <CAOD=uF4h5pqfU3u=fVZu74kEP=HLFQWd2+qPRrT69Jtjn+11bw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4FE473F6.5000109@fusionio.com>
	<20120625111048.GA10393@elgon.mountain>
	<20120625133956.GA2499@localhost.localdomain>
	<20120625135344.GN5390@mwanda>
In-Reply-To: <20120625135344.GN5390@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Josef Bacik <jbacik@fusionio.com>, "Chris L. Mason" <clmason@fusionio.com>, "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

I am also facing similar issue while applying this patch.

[santosh@localhost linux-next]$ sudo git am mail_Dan.txt
Patch format detection failed.
[santosh@localhost linux-next]$




regards
santosh

On Mon, Jun 25, 2012 at 7:23 PM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:
> On Mon, Jun 25, 2012 at 09:41:12AM -0400, Josef Bacik wrote:
>> On Mon, Jun 25, 2012 at 05:15:23AM -0600, Dan Carpenter wrote:
>> > We dereferenced "node" in the error message after freeing it. =A0Also
>> > btrfs_panic() can return so we should return an error code instead of
>> > continuing.
>> >
>> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> > ---
>> > v2: in the first version I just deleted the kfree().
>> >
>> > diff --git a/fs/btrfs/relocation.c b/fs/btrfs/relocation.c
>> > index 790f492..4da0865 100644
>> > --- a/fs/btrfs/relocation.c
>> > +++ b/fs/btrfs/relocation.c
>> > @@ -1239,10 +1239,11 @@ static int __must_check __add_reloc_root(struc=
t btrfs_root *root)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 node->bytenr, &nod=
e->rb_node);
>> > =A0 =A0 spin_unlock(&rc->reloc_root_tree.lock);
>> > =A0 =A0 if (rb_node) {
>> > - =A0 =A0 =A0 =A0 =A0 kfree(node);
>> > =A0 =A0 =A0 =A0 =A0 =A0 btrfs_panic(root->fs_info, -EEXIST, "Duplicate=
 root found "
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "for start=3D%llu whil=
e inserting into relocation "
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "tree\n", node->bytenr=
);
>> > + =A0 =A0 =A0 =A0 =A0 kfree(node);
>> > + =A0 =A0 =A0 =A0 =A0 return -EEXIST;
>> > =A0 =A0 }
>> >
>> > =A0 =A0 list_add_tail(&root->root_list, &rc->reloc_roots);
>>
>> I'm not sure why but it seems like this patch is wrapped. =A0At first I =
thought it
>> was thunderbird but then I opened it up and saved it from mutt and I got=
 the
>> same problem. =A0I will fix it up, but you may want to check your mail c=
lient.
>
> The message that went through to kernel-janitors applies fine for
> me. =A0I'm not sure what to say.
>
> regards,
> dan carpenter
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors=
" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
