From: Amelie DELAUNAY <amelie.delaunay@st.com>
Date: Wed, 28 Oct 2020 14:38:54 +0000
Subject: Re: [PATCH 2/2] usb: typec: stusb160x: fix some signedness bugs
Message-Id: <9e3c4790-13d5-371a-52c9-8945faff66ab@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201023112412.GD282278@mwanda>
 <625bf21d-e3bb-f952-9368-d93bee05a461@st.com> <20201028132346.GP18329@kadam>
In-Reply-To: <20201028132346.GP18329@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Greg,

I know I'm a bit late for the review, but is it still possible to fixup 
this patch in your usb-linus branch?

Regards,
Amelie

On 10/28/20 2:23 PM, Dan Carpenter wrote:
> On Wed, Oct 28, 2020 at 01:26:16PM +0100, Amelie DELAUNAY wrote:
>>> @@ -567,9 +567,10 @@ static int stusb160x_get_fw_caps(struct stusb160x *chip,
>>>    	if (!ret) {
>>>    		chip->pwr_opmode = typec_find_pwr_opmode(cap_str);
>>>    		/* Power delivery not yet supported */
>>> -		if (chip->pwr_opmode < 0 ||
>>> +		if ((int)chip->pwr_opmode < 0 ||
>>>    		    chip->pwr_opmode = TYPEC_PWR_MODE_PD) {
>>> -			ret = chip->pwr_opmode < 0 ? chip->pwr_opmode : -EINVAL;
>>> +			ret = (int)chip->pwr_opmode < 0 ? chip->pwr_opmode :
>>> +							  -EINVAL;
>>>    			dev_err(chip->dev, "bad power operation mode: %d\n",
>>>    				chip->pwr_opmode);
>>>    			return ret;
>>>
>>
>> 	if (!ret) {
>> 		ret = typec_find_pwr_opmode(cap_str);
>> 		/* Power delivery not yet supported */
>> 		if (ret < 0 || ret = TYPEC_PWR_MODE_PD) {
>> 			dev_err(chip->dev, "bad power operation mode: %d\n", ret);
>> 			return -EINVAL;
>> 		}
>> 		chip->pwr_opmode = ret;
>> 	}
>>
>>
>> So, which fix sounds better ? IMHO using ret make the code more readable.
> 
> Yeah.  Your patch is nicer, but Greg *just* merged mine so it might
> be too late...
> 
> regards,
> dan carpenter
> 
