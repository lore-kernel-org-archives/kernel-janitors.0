From: David Sterba <dsterba@suse.cz>
Date: Tue, 03 Dec 2019 18:40:39 +0000
Subject: Re: [PATCH v2] btrfs: Fix btrfs_find_create_tree_block() testing
Message-Id: <20191203184039.GU2734@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191203110408.GA30629@linux.ibm.com>
 <20191203112457.GF1787@kadam>
In-Reply-To: <20191203112457.GF1787@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <jbacik@fb.com>, David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Mike Rapoport <rppt@linux.ibm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Dec 03, 2019 at 02:24:58PM +0300, Dan Carpenter wrote:
> The btrfs_find_create_tree_block() uses alloc_test_extent_buffer() for
> testing and alloc_extent_buffer() for production.  The problem is that
> the test code returns NULL and the production code returns error
> pointers.  The callers only check for error pointers.
> 
> I have changed alloc_test_extent_buffer() to return error pointers and
> updated the two callers which use it directly.
> 
> Fixes: faa2dbf004e8 ("Btrfs: add sanity tests for new qgroup accounting code")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I edited the changelog because btrfs_find_create_tree_block is
misleading and seems to be unrelated to the actual fix that's just for
alloc_test_extent_buffer. Patch added to misc-next, thanks.
