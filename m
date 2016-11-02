From: David Sterba <dsterba@suse.cz>
Date: Wed, 02 Nov 2016 14:30:46 +0000
Subject: Re: [PATCH] btrfs: Remove some dead code
Message-Id: <20161102143046.GF12522@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161101102606.27006-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161101102606.27006-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: clm@fb.com, jbacik@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Nov 01, 2016 at 11:26:06AM +0100, Christophe JAILLET wrote:
> 'btrfs_iget()' can not return an error pointer, so this test can be
> removed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Reviewed-by: David Sterba <dsterba@suse.com>
