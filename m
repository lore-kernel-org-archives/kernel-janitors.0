From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 20 Jul 2016 18:46:08 +0000
Subject: Re: [PATCH 5/9] staging: ks7010: Delete unnecessary uses of the variable "retval"
Message-Id: <b249584b-47b8-ffd9-432e-986d69260ff1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
 <6a8f4258-188e-36f6-28fa-1626c29cf361@users.sourceforge.net>
 <alpine.DEB.2.10.1607172056220.3177@hadrien> <20160720155333.GE1688@katana>
In-Reply-To: <20160720155333.GE1688@katana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>>> @@ -90,7 +90,6 @@ static int ks7010_sdio_write(struct ks_wlan_private *priv, unsigned int address,
>>>  void ks_wlan_hw_sleep_doze_request(struct ks_wlan_private *priv)
>>>  {
>>>  	unsigned char rw_data;
>>> -	int retval;
>>>
>>>  	DPRINTK(4, "\n");
>>>
>>> @@ -99,9 +98,10 @@ void ks_wlan_hw_sleep_doze_request(struct ks_wlan_private *priv)
>>>
>>>  	if (atomic_read(&priv->sleepstatus.status) = 0) {
>>>  		rw_data = GCR_B_DOZE;
>>> -		retval >>> -		    ks7010_sdio_write(priv, GCR_B, &rw_data, sizeof(rw_data));
>>> -		if (retval) {
>>> +		if (ks7010_sdio_write(priv,
>>> +				      GCR_B,
>>> +				      &rw_data,
>>> +				      sizeof(rw_data))) {
>>
>> A multi-line function call in an if test does not look nice at all.  The
>> original code was an easy-to-read expectable pattern.
> 
> I agree. I am not strict on the 80 char limit, especially in cases like
> the above.

Would you try an other source code formatting for the suggested change pattern?

Regards,
Markus
