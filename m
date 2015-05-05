From: Theodore Ts'o <tytso@mit.edu>
Date: Tue, 05 May 2015 02:31:15 +0000
Subject: Re: [PATCH 0/5] fs: ext4: balloc: Fixing code style issues
Message-Id: <20150505023115.GA16076@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430786599-3843-1-git-send-email-adirkuhn@gmail.com>
In-Reply-To: <1430786599-3843-1-git-send-email-adirkuhn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, May 05, 2015 at 12:43:14AM +0000, Adir Kuhn wrote:
> Fixing code style issues

NACK.  I only take code style changes if we are making changes in the
surrounding code.  Code style changes break pending patches that other
developers might be sending me and so not only do they add zero value,
they are actively harmful.

					- Ted
