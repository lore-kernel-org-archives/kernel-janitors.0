From: Colin Ian King <colin.king@canonical.com>
Date: Wed, 03 Jun 2020 15:10:44 +0000
Subject: Re: [PATCH] input: ims-pcu: remove redundant assignment to variable 'error'
Message-Id: <ee8443d6-3ac1-83ba-a921-e9fdbc7a02c3@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603135102.130436-1-colin.king@canonical.com>
 <20200603140953.GL30374@kadam>
 <c4290ddf-8faa-bb09-bd96-4c01a3f1cc2b@canonical.com>
 <20200603144507.GM30374@kadam>
In-Reply-To: <20200603144507.GM30374@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/06/2020 15:45, Dan Carpenter wrote:
> On Wed, Jun 03, 2020 at 03:18:46PM +0100, Colin Ian King wrote:
>> On 03/06/2020 15:09, Dan Carpenter wrote:
>>> On Wed, Jun 03, 2020 at 02:51:02PM +0100, Colin King wrote:
>>>> From: Colin Ian King <colin.king@canonical.com>
>>>>
>>>> The variable error is being initialized with a value that is
>>>> never read and the -ENOMEM error return is being returned anyhow
>>>> by the error exit path to label err_free_mem.  The assignment is
>>>> redundant and can be removed.
>>>>
>>>> Addresses-Coverity: ("Unused value")
>>>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>>>> ---
>>>>  drivers/input/misc/ims-pcu.c | 1 -
>>>>  1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/drivers/input/misc/ims-pcu.c b/drivers/input/misc/ims-pcu.c
>>>> index d8dbfc030d0f..4ba68aa3d281 100644
>>>> --- a/drivers/input/misc/ims-pcu.c
>>>> +++ b/drivers/input/misc/ims-pcu.c
>>>> @@ -292,7 +292,6 @@ static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
>>>>  	if (!gamepad || !input) {
>>>>  		dev_err(pcu->dev,
>>>>  			"Not enough memory for gamepad device\n");
>>>> -		error = -ENOMEM;
>>>>  		goto err_free_mem;
>>>
>>> It would be better to change the return instead.
>>>
>>> regards,
>>> dan carpenter
>>>
>>
>> I'm not sure about that, the err_free_mem path is used by another error
>> exit return path that also needs to free the device and gamepad and
>> returns ENOMEM, so I think this is a good enough shared error exit strategy.
> 
> The code looks like this:
> 
> drivers/input/misc/ims-pcu.c
>    284  static int ims_pcu_setup_gamepad(struct ims_pcu *pcu)
>    285  {
>    286          struct ims_pcu_gamepad *gamepad;
>    287          struct input_dev *input;
>    288          int error;
>    289  
>    290          gamepad = kzalloc(sizeof(struct ims_pcu_gamepad), GFP_KERNEL);
>    291          input = input_allocate_device();
>    292          if (!gamepad || !input) {
>    293                  dev_err(pcu->dev,
>    294                          "Not enough memory for gamepad device\n");
>    295                  error = -ENOMEM;
>    296                  goto err_free_mem;
> 
> The "error" is always set before all the gotos.
> 
>    297          }
>    298  
>    299          gamepad->input = input;
>    300  
>    301          snprintf(gamepad->name, sizeof(gamepad->name),
>    302                   "IMS PCU#%d Gamepad Interface", pcu->device_no);
>    303  
>    304          usb_make_path(pcu->udev, gamepad->phys, sizeof(gamepad->phys));
>    305          strlcat(gamepad->phys, "/input1", sizeof(gamepad->phys));
>    306  
>    307          input->name = gamepad->name;
>    308          input->phys = gamepad->phys;
>    309          usb_to_input_id(pcu->udev, &input->id);
>    310          input->dev.parent = &pcu->ctrl_intf->dev;
>    311  
>    312          __set_bit(EV_KEY, input->evbit);
>    313          __set_bit(BTN_A, input->keybit);
>    314          __set_bit(BTN_B, input->keybit);
>    315          __set_bit(BTN_X, input->keybit);
>    316          __set_bit(BTN_Y, input->keybit);
>    317          __set_bit(BTN_START, input->keybit);
>    318          __set_bit(BTN_SELECT, input->keybit);
>    319  
>    320          __set_bit(EV_ABS, input->evbit);
>    321          input_set_abs_params(input, ABS_X, -1, 1, 0, 0);
>    322          input_set_abs_params(input, ABS_Y, -1, 1, 0, 0);
>    323  
>    324          error = input_register_device(input);
>    325          if (error) {
>    326                  dev_err(pcu->dev,
>    327                          "Failed to register gamepad input device: %d\n",
>    328                          error);
>    329                  goto err_free_mem;
> 
> The input_register_device() can return a bunch of different error codes.
> Better to preserve them.  "error" is set.
> 
>    330          }
>    331  
>    332          pcu->gamepad = gamepad;
>    333          return 0;
>    334  
>    335  err_free_mem:
>    336          input_free_device(input);
>    337          kfree(gamepad);
>    338          return -ENOMEM;
> 
> We just change this from "return -ENOMEM;" to "return error;"
> 
>    339  }
> 
> regards,
> dan carpenter
> 
Elegantly explained, thanks Dan, I'll send a V2.

Colin
