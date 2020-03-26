From: Chuck Lever <chuck.lever@oracle.com>
Date: Thu, 26 Mar 2020 22:29:41 +0000
Subject: Re: [PATCH 2/2] SUNRPC: Optimize 'svc_print_xprts()'
Message-Id: <9AC34F25-68B7-4184-9A91-A6D026F6BA6F@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200325070452.22043-1-christophe.jaillet@wanadoo.fr>
 <EA5BCDB2-DB05-4B26-8635-E6F5C231DDC6@oracle.com>
 <42afbf1f-19e1-a05c-e70c-1d46eaba3a71@wanadoo.fr>
 <87wo786o80.fsf@notabene.neil.brown.name>
 <2e2d1293-c978-3f1d-5a1e-dc43dc2ad06b@wanadoo.fr>
 <87r1xe7pvy.fsf@notabene.neil.brown.name>
In-Reply-To: <87r1xe7pvy.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Neil Brown <neilb@suse.de>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux NFS Mailing List <linux-nfs@vger.kernel.org>, kernel-janitors@vger.kernel.org



> On Mar 26, 2020, at 5:44 PM, NeilBrown <neilb@suse.de> wrote:
> 
> On Thu, Mar 26 2020, Christophe JAILLET wrote:
> 
>> Le 25/03/2020 à 23:53, NeilBrown a écrit :
>>> Can I suggest something more like this:
>>> diff --git a/net/sunrpc/svc_xprt.c b/net/sunrpc/svc_xprt.c
>>> index de3c077733a7..0292f45b70f6 100644
>>> --- a/net/sunrpc/svc_xprt.c
>>> +++ b/net/sunrpc/svc_xprt.c
>>> @@ -115,16 +115,9 @@ int svc_print_xprts(char *buf, int maxlen)
>>>  	buf[0] = '\0';
>>> 
>>>  	spin_lock(&svc_xprt_class_lock);
>>> -	list_for_each_entry(xcl, &svc_xprt_class_list, xcl_list) {
>>> -		int slen;
>>> -
>>> -		sprintf(tmpstr, "%s %d\n", xcl->xcl_name, xcl->xcl_max_payload);
>>> -		slen = strlen(tmpstr);
>>> -		if (len + slen > maxlen)
>>> -			break;
>>> -		len += slen;
>>> -		strcat(buf, tmpstr);
>>> -	}
>>> +	list_for_each_entry(xcl, &svc_xprt_class_list, xcl_list)
>>> +		len += scnprintf(buf + len, maxlen - len, "%s %d\n",
>>> +				 xcl->xcl_name, xcl->xcl_max_payload);
>>>  	spin_unlock(&svc_xprt_class_lock);
>>> 
>>>  	return len;
>>> 
>>> NeilBrown
>> 
>> Hi,
>> 
>> this was what I suggested in the patch:
>>     ---
>>     This patch should have no functional change.
>>     We could go further, use scnprintf and write directly in the 
>> destination
>>     buffer. However, this could lead to a truncated last line.
>>     ---
> 
> Sorry - I missed that.
> So add
> 
> end = strrchr(tmpstr, '\n');
> if (end)
>    end[1] = 0;
> else
>    tmpstr[0] = 0;
> 
> or maybe something like
> 	list_for_each_entry(xcl, &svc_xprt_class_list, xcl_list) {
> 		int l = snprintf(buf + len, maxlen - len, "%s %d\n",
> 				 xcl->xcl_name, xcl->xcl_max_payload);
>                if (l < maxlen - len)
>                	len += l;
>        }
>        buf[len] = 0;
> 
> There really is no need to have the secondary buffer, and I think doing
> so just complicates the code.

In the interest of getting this fix into the upcoming merge window, let's
stick with the temporary buffer approach. Thanks!


--
Chuck Lever
