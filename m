From: Artem Bityutskiy <dedekind1@gmail.com>
Date: Sat, 15 Aug 2009 09:15:17 +0000
Subject: Re: [PATCH][RFC] security: constify seq_operations
Message-Id: <4A867CA5.1050103@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LRH.2.00.0908112337450.21218@tundra.namei.org> <20090811143643.GA15096@us.ibm.com> <alpine.LRH.2.00.0908120129290.22015@tundra.namei.org> <Pine.LNX.4.64.0908112138290.9996@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908112138290.9996@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Julia Lawall <julia@diku.dk>
Cc: James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serue@us.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, Arjan van de Ven <arjan@infradead.org>, kernel-janitors@vger.kernel.org

On 08/11/2009 10:47 PM, Julia Lawall wrote:
> A while ago I made a semantic patch to introduce const on file_operations
> and and input_device_id types.  I tested it on 142 files in which the
> change had already been made and got the same result in each case.  I have
> run it on linux-next and obtained the attached result.  However, I have
> not checked any of these results, so this is not meant as a submitted
> patch, but as a starting point for someone who wants to look further into
> the problem.
>
> julia
>

snip

> diff -u -p a/fs/ubifs/xattr.c b/fs/ubifs/xattr.c
> --- a/fs/ubifs/xattr.c 2009-06-27 09:35:06.000000000 +0200
> +++ b/fs/ubifs/xattr.c 2009-08-11 22:42:24.000000000 +0200
> @@ -80,7 +80,7 @@ enum {
>
>   static struct inode_operations none_inode_operations;
>   static struct address_space_operations none_address_operations;
> -static struct file_operations none_file_operations;
> +static const struct file_operations none_file_operations;

Fixed this in UBIFS. Also made the inode operation const. Thanks.
Pushed to ubifs-2.6.git:
http://git.infradead.org/ubifs-2.6.git/commit/2d132c333e9f88684801c9b80e6ba086da4f0ea0

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
