From: Jan Kara <jack@suse.cz>
Date: Tue, 22 Aug 2017 10:48:15 +0000
Subject: Re: isofs: One check less in isofs_read_inode() after error detection
Message-Id: <20170822104815.GJ4909@quack2.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ed931e75-f443-6e19-ca56-4c1ad027dc25@users.sourceforge.net>
 <157aa252-0edb-1462-cb6e-44369e8f1645@users.sourceforge.net>
 <20170821141139.GD31870@quack2.suse.cz>
 <d2516ec9-5231-bbeb-3534-f0bd6992478c@users.sourceforge.net>
In-Reply-To: <d2516ec9-5231-bbeb-3534-f0bd6992478c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Jan Kara <jack@suse.cz>, Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon 21-08-17 16:18:14, SF Markus Elfring wrote:
> > I agree that
> > 
> > fail:
> >         goto out;
> > 
> > in the original code is awkward and we can get rid of it.
> 
> How would you like to change this place instead?

Just do 'goto out' directly.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
