From: "Ted Ts'o" <tytso@mit.edu>
Date: Mon, 20 Dec 2010 02:39:59 +0000
Subject: Re: ext4: Remove redundant unlikely()
Message-Id: <20101220023959.GA24990@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1291905638-32410-1-git-send-email-tklauser@distanz.ch>
In-Reply-To: <1291905638-32410-1-git-send-email-tklauser@distanz.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tobias Klauser <tklauser@distanz.ch>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Dec 09, 2010 at 04:40:38AM -0000, Tobias Klauser wrote:
> IS_ERR() already implies unlikely(), so it can be omitted here.
> 
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Thanks, added to ext4 patch queue.

					- Ted
