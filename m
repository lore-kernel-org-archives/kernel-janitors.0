From: Phillip Lougher <phillip.lougher@gmail.com>
Date: Wed, 17 Jul 2013 04:20:31 +0000
Subject: Re: [patch] Squashfs: sanity check information from disk
Message-Id: <CAB3wodeBWvgF9oKb9OVXNABiafhvLticB=x8s=R81RRv9Yd6kA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130715161058.GA23687@elgon.mountain>
In-Reply-To: <20130715161058.GA23687@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Phillip Lougher <phillip@squashfs.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 15 July 2013 17:17, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> We read the size of the name from the disk, but a larger name than
> expected would cause memory corruption.

Thanks for the patch, it's queued for the next merge window. There's
one mistake with the patch, but I can fix it when it's applied, or you
can send a revised patch (see later).

>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I don't know this code very well, but to me it looks like there is an
> off by one bug here as well.

No, the code is perfectly OK here, the confusion stems from what the
+1 is doing.

>
> We say:
>
>         size = le32_to_cpu(index->size) + 1;
>
> The "+ 1" is presumably for the NUL terminator.  Then we do:

index->size is one less than the size of the name, so to get the true
size of the name we must add one to it.  If index->size is 7 it means
the size of the name stored on disk is 8 bytes.

This storing the size as one less came from the observation we never
have 0 length filenames, and so 0 would effectively never be used.

>
>         index->name[size] = '\0';
>
> That means we are putting a NUL character one space beyond the end of
> the array.  Presumably the first character of the next thing saved to
> the disk is usually zero so that's why we don't notice that we are
> reading a extra character when we read "size" number of bytes.

>
> diff --git a/fs/squashfs/namei.c b/fs/squashfs/namei.c
> index 7834a51..bc1334c 100644
> --- a/fs/squashfs/namei.c
> +++ b/fs/squashfs/namei.c
> @@ -79,7 +79,8 @@ static int get_dir_index_using_name(struct super_block *sb,
>                         int len)
>  {
>         struct squashfs_sb_info *msblk = sb->s_fs_info;
> -       int i, size, length = 0, err;
> +       int i, length = 0, err;
> +       unsigned int size;
>         struct squashfs_dir_index *index;
>         char *str;
>
> @@ -103,6 +104,10 @@ static int get_dir_index_using_name(struct super_block *sb,
>
>
>                 size = le32_to_cpu(index->size) + 1;
> +               if (size >= SQUASHFS_NAME_LEN + 1) {

This should be

 if (size > SQUASHFS_NAME_LEN)

I can fix it, or you can send a revised patch.

Phillip
