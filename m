From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Sun, 06 Mar 2005 19:38:40 +0000
Subject: Re: [KJ] kernel-parameters.txt
Message-Id: <422B5C40.1020706@osdl.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <422A58AB.8040601@osdl.org>
In-Reply-To: <422A58AB.8040601@osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Eamonn Lachlan wrote:
> Randy Dunlap wrote:
> 
>>I just noticed that "kstack=" is not documented in
>>Documentation/kernel-parameters.txt.
>>
>>It would be a Good Thing is someone would check for
>>kernel parameters/options that are missing from
>>kernel-parameters.txt and add them...
> 
> 
> I'll try to sort that out. Thanks, Randy.

Drat.  I just noticed that there is a file for x64-64 that
contains boot options:
Documentation/x86_64/boot-options.txt

which is too bad IMO, that should be merged into
kernel-parameters.txt, with indications that they are
X86-64 only.

-- 
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
