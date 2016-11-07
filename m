From: David Sterba <dsterba@suse.cz>
Date: Mon, 07 Nov 2016 16:19:27 +0000
Subject: Re: [PATCH V2] btrfs: Remove some dead code
Message-Id: <20161107161927.GP12522@twin.jikos.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161104070235.12975-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20161104070235.12975-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: clm@fb.com, jbacik@fb.com, dsterba@suse.com, linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Nov 04, 2016 at 08:02:35AM +0100, Christophe JAILLET wrote:
> 'btrfs_iget()' can not return NULL, so this test can be removed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Patch replaced, I've edited the subject to be a bit more specific.
