From: Jeff Layton <jlayton@samba.org>
Date: Fri, 27 Apr 2012 13:40:33 +0000
Subject: Re: [patch] cifs: fix revalidation test in cifs_llseek()
Message-Id: <20120427094033.18733a5f@corrin.poochiereds.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120419210619.GA19074@elgon.mountain>
	<CAKywueQrrHdqXXrHQbP=vjs_MLjksvR09cpax0iWw-PS6ms=fg@mail.gmail.com>
In-Reply-To: <CAKywueQrrHdqXXrHQbP=vjs_MLjksvR09cpax0iWw-PS6ms=fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Pavel Shilovsky <piastryyy@gmail.com>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, kernel-janitors@vger.kernel.org, Steve French <sfrench@samba.org>, Dan Carpenter <dan.carpenter@oracle.com>, Josef Bacik <josef@redhat.com>

On Fri, 27 Apr 2012 16:59:07 +0400
Pavel Shilovsky <piastryyy@gmail.com> wrote:

> 20 апреля 2012 г. 1:06 пользователь Dan Carpenter
> <dan.carpenter@oracle.com> написал:
> > This test is always true so it means we revalidate the length every
> > time, which generates more network traffic.  This was introduced in
> > 06222e491e "fs: handle SEEK_HOLE/SEEK_DATA properly in all fs's that
> > define their own llseek".
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Josef, there were three other places that had this same problem but I
> > think they've all been fixed now.  Except that I had a question about
> > nfs_file_llseek().  Isn't that reversed?  It seems like it only
> > revalidates when it's not supposed to.  I chose to copy what
> > fuse_file_llseek() does instead.
> >
> > diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
> > index d342128..97d26c7 100644
> > --- a/fs/cifs/cifsfs.c
> > +++ b/fs/cifs/cifsfs.c
> > @@ -695,7 +695,7 @@ static loff_t cifs_llseek(struct file *file, loff_t offset, int origin)
> >         * origin = SEEK_END || SEEK_DATA || SEEK_HOLE => we must revalidate
> >         * the cached file length
> >         */
> > -       if (origin != SEEK_SET || origin != SEEK_CUR) {
> > +       if (origin = SEEK_SET || origin = SEEK_CUR) {
> >                int rc;
> >                struct inode *inode = file->f_path.dentry->d_inode;
> >
> 
> In this case the semantic contradict the comment above. May be it
> should be "if (origin != SEEK_SET && origin != SEEK_CUR)"?
> 

Agreed, I think Pavel is correct here. The stuff inside the if block
revalidates the file size, and we only need to do that if whence is not
SEEK_SET or SEEK_CUR.

-- 
Jeff Layton <jlayton@samba.org>
