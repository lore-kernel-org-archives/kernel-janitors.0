From: Gustavo Franco <stratus@acm.org>
Date: Sun, 23 May 2004 01:12:10 +0000
Subject: [Kernel-janitors] Re: request_region() on sound/oss/wavfront.c.
Message-Id: <40AFFA6A.1010502@acm.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============59812238695386544=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040522224343.GA1643@masina>
In-Reply-To: <20040522224343.GA1643@masina>
To: kernel-janitors@vger.kernel.org

--===============59812238695386544==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Domen Puncer wrote:

>On 23/05/04 00:43 +0200, Domen Puncer wrote:
>  
>
>>On 22/05/04 18:54 -0300, Gustavo Franco wrote:
>>
>>    
>>
>>>+++ sound/oss/wavfront.c  2004-05-22 18:28:38.000000000 -0300
>>>+       if (!request_region (io_base, 16, "wavefront")) {
>>>      
>>>
>>Few lines later there is a:
>>	dev.base = io_base;
>>So this will print ugly error messages.
>>    
>>
Sorry, but do you mean KERN_ERR ones?

>>    
>>
>>>+       if(!request_region (dev.base+2, 6, "wavefront synth")) {
>>>+               if(!request_region (dev.base+8, 8, "wavefront fx")) {
>>>      
>>>
>>IMHO, you can just get rid of latter 2 request_region's.
>>    
>>
>
>Ehm, no, damn. Comment above check_region states that device can take
>up 8 ports.
>
>So if there is another device on base+8 this wont work correctly (if that
>device registred it's region before, even the old code wont work ok).
>
>  
>
What? Can you summarize your two messages? Check that both 
request_region() cited
by you above were not added by me, i've added a return check only.


Thanks,
--
Gustavo Franco

--===============59812238695386544==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============59812238695386544==--
