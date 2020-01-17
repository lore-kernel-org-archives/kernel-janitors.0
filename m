From: Nikolay Borisov <nborisov@suse.com>
Date: Fri, 17 Jan 2020 07:11:19 +0000
Subject: Re: [PATCH] btrfs: tests: Fix an NULL vs IS_ERR() test
Message-Id: <80bf4ca9-483c-b8c9-df49-50ec012ae6e6@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200117053432.k46ftoqf67dezauh@kili.mountain>
In-Reply-To: <20200117053432.k46ftoqf67dezauh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Chris Mason <clm@fb.com>
Cc: Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org



On 17.01.20 г. 7:34 ч., Dan Carpenter wrote:
> The btrfs_alloc_dummy_device() function never returns NULL, it returns
> error pointers.
> 
> Fixes: 5d9a4f871168 ("btrfs: Add self-tests for btrfs_rmap_block")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Doh...

Reviewed-by: Nikolay Borisov <nborisov@suse.com>



> ---
>  fs/btrfs/tests/extent-map-tests.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/btrfs/tests/extent-map-tests.c b/fs/btrfs/tests/extent-map-tests.c
> index b7f2c4398e92..70a2f0dc9a78 100644
> --- a/fs/btrfs/tests/extent-map-tests.c
> +++ b/fs/btrfs/tests/extent-map-tests.c
> @@ -490,9 +490,9 @@ static int test_rmap_block(struct btrfs_fs_info *fs_info,
>  	for (i = 0; i < map->num_stripes; i++) {
>  		struct btrfs_device *dev = btrfs_alloc_dummy_device(fs_info);
>  
> -		if (!dev) {
> +		if (IS_ERR(dev)) {
>  			test_err("cannot allocate device");
> -			ret = -ENOMEM;
> +			ret = PTR_ERR(dev);
>  			goto out;
>  		}
>  		map->stripes[i].dev = dev;
> 
