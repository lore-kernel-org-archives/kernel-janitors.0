From: Richard Knutsson <ricknu-0@student.ltu.se>
Date: Tue, 31 Jul 2007 12:19:27 +0000
Subject: Re: [PATCH 02/68] 0 -> NULL, for arch/arm
Message-Id: <46AF28CF.6000302@student.ltu.se>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200707270944.LAA17082@ifs.emn.fr> <20070727095905.GU27237@ftp.linux.org.uk> <Pine.LNX.4.64.0707271250020.12711@fbirervta.pbzchgretzou.qr>
In-Reply-To: <Pine.LNX.4.64.0707271250020.12711@fbirervta.pbzchgretzou.qr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: Al Viro <viro@ftp.linux.org.uk>, Yoann Padioleau <padator@wanadoo.fr>, kernel-janitors@vger.kernel.org, rmk@arm.linux.org.uk, akpm@linux-foundation.org, linux-kernel@vger.kernel.org

Jan Engelhardt wrote:
> On Jul 27 2007 10:59, Al Viro wrote:
>   
>> On Fri, Jul 27, 2007 at 11:44:07AM +0200, Yoann Padioleau wrote:
>>     
>>>  		buf = alloc_safe_buffer(device_info, ptr, size, dir);
>>> -		if (buf = 0) {
>>> +		if (buf = NULL) {
>>>       
>> 		if (!buf)
>> surely...
>>     
>
> Makes it look like it's used as a bool.
>   
But the conditional checking for a pointer and a boolean is the same; 0 
= NULL = 'false' and the rest is valid/'true'. So IMHO it is a cleaner 
way to write it. But then again, some people like to abuse the '!' on 
"regular" variables.

Richard Knutsson


