From: Viacheslav Dubeyko <slava@dubeyko.com>
Date: Tue, 26 Jan 2016 18:18:56 +0000
Subject: Re: [patch] hfs: fix hfs_readdir()
Message-Id: <1453832336.2633.10.camel@slavad-ubuntu-14.04>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160126092611.GD15717@mwanda>
In-Reply-To: <20160126092611.GD15717@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chengyu Song <csong84@gatech.edu>, Andrew Morton <akpm@linux-foundation.org>, David Howells <dhowells@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 2016-01-26 at 12:26 +0300, Dan Carpenter wrote:
> I was looking through static analysis warnings and we seem to be copying
> garbage into &rd->key.  This goes back to before the start of git...
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not tested.  Please review carefully.
> 
> diff --git a/fs/hfs/dir.c b/fs/hfs/dir.c
> index 70788e0..66485d7 100644
> --- a/fs/hfs/dir.c
> +++ b/fs/hfs/dir.c
> @@ -163,7 +163,7 @@ static int hfs_readdir(struct file *file, struct dir_context *ctx)
>  		rd->file = file;
>  		list_add(&rd->list, &HFS_I(inode)->open_dir_list);
>  	}
> -	memcpy(&rd->key, &fd.key, sizeof(struct hfs_cat_key));
> +	memcpy(&rd->key, &fd.key->cat, sizeof(struct hfs_cat_key));

The field "key" is union:

164 typedef union hfs_btree_key {
165         u8 key_len;                     /* number of bytes in the key */
166         struct hfs_cat_key cat;
167         struct hfs_ext_key ext;
168 } hfs_btree_key;

The struct hfs_cat_key is the biggest item. So, size of this structure
is dominating in the union:

157 struct hfs_ext_key {
158         u8 key_len;             /* number of bytes in the key */
159         u8 FkType;              /* HFS_FK_{DATA,RSRC} */
160         __be32 FNum;            /* The File ID of the file */
161         __be16 FABN;            /* allocation blocks number*/
162 } __packed;

149 struct hfs_cat_key {
150         u8 key_len;             /* number of bytes in the key */
151         u8 reserved;            /* padding */
152         __be32 ParID;           /* CNID of the parent dir */
153         struct hfs_name CName;  /* The filename of the entry */
154 } __packed;

because:

27 #define HFS_NAMELEN             31     /* maximum length of an HFS filename */

87 struct hfs_name {
88         u8 len;
89         u8 name[HFS_NAMELEN];
90 } __packed;

If we are using sizeof(struct hfs_cat_key) then it looks like that we
could potentially miss one byte of the union during catalog key copying.
But if we will copy struct hfs_ext_key then we will copy some amount of
"garbage" anyway. So, I don't think that it's good fix of the issue.
What do you think?

Another worry could be the "search_key" field of the struct
hfs_find_data.

Thanks,
Vyacheslav Dubeyko.


