From: Matthew Wilcox <willy@debian.org>
Date: Thu, 01 Apr 2004 20:55:09 +0000
Subject: Re: [Kernel-janitors] [patch] fix kernel start
Message-Id: <20040401205509.GC16469@parcelfarce.linux.theplanet.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040401204915.GA2664@sputnik.stro.at>
In-Reply-To: <20040401204915.GA2664@sputnik.stro.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Apr 01, 2004 at 10:49:15PM +0200, maximilian attems wrote:
> linux-2.6.5-rc2 has a quick count of 33 main() 
> function in it's sources, but non of them is
> the real Zonked Quokka.
> 
> patch compile && boot tested
> archs will easily catch up!

What's the point?  It's a kernel, not a regular C program.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
