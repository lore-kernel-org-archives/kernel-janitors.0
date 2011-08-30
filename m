From: Dan Carpenter <error27@gmail.com>
Date: Tue, 30 Aug 2011 19:54:11 +0000
Subject: Re: Where can i find a task?
Message-Id: <20110830195411.GA3705@shale.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4E4EA626.8070204@lxsameer.com>
In-Reply-To: <4E4EA626.8070204@lxsameer.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Also it's often a mistake to print blank lines to dmesg for no
reason.

grep '\\n\\n' drivers/ -R 

But those are slightly more controversial.

regards,
dan carpenter
