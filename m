From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 21 Jul 2016 14:16:00 +0000
Subject: Re: staging: ks7010: Delete three unnecessary variable initialisations
Message-Id: <3d9736a8-1afd-3c9d-a03a-d4093b8ae1c0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <23b93bc6-f938-7f8c-8cf1-f70e453e06e6@users.sourceforge.net>
 <alpine.DEB.2.10.1607172049560.3177@hadrien>
 <47a5f5be-7c6b-0e39-5182-db9aec4bea30@users.sourceforge.net>
 <alpine.DEB.2.10.1607211550580.2927@hadrien>
In-Reply-To: <alpine.DEB.2.10.1607211550580.2927@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> * Do you occasionally care for a refactoring like "Reduce scope of variable"?
>>
>>   http://refactoring.com/catalog/reduceScopeOfVariable.html
> 
> Probably not.  Certainly not in this case.

In which use cases would the suggested change pattern be more interesting
for you?

Regards,
Markus
