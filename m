From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 21 Aug 2017 14:18:14 +0000
Subject: Re: isofs: One check less in isofs_read_inode() after error detection
Message-Id: <d2516ec9-5231-bbeb-3534-f0bd6992478c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ed931e75-f443-6e19-ca56-4c1ad027dc25@users.sourceforge.net>
 <157aa252-0edb-1462-cb6e-44369e8f1645@users.sourceforge.net>
 <20170821141139.GD31870@quack2.suse.cz>
In-Reply-To: <20170821141139.GD31870@quack2.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Al Viro <viro@zeniv.linux.org.uk>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

> I agree that
> 
> fail:
>         goto out;
> 
> in the original code is awkward and we can get rid of it.

How would you like to change this place instead?


> However renaming labels is IMO pointless and
> 
>>  	if (bh)
>> +release_bh:
>>  		brelse(bh);
>>  	return ret;
> 
> is just disgusting.

I know that it can be occasionally harder to achieve the desired consensus.

Regards,
Markus
