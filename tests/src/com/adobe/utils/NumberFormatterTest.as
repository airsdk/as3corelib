/*
	Adobe Systems Incorporated(r) Source Code License Agreement
	Copyright(c) 2005 Adobe Systems Incorporated. All rights reserved.
	
	Please read this Source Code License Agreement carefully before using
	the source code.
	
	Adobe Systems Incorporated grants to you a perpetual, worldwide, non-exclusive, 
	no-charge, royalty-free, irrevocable copyright license, to reproduce,
	prepare derivative works of, publicly display, publicly perform, and
	distribute this source code and such derivative works in source or 
	object code form without any attribution requirements.  
	
	The name "Adobe Systems Incorporated" must not be used to endorse or promote products
	derived from the source code without prior written permission.
	
	You agree to indemnify, hold harmless and defend Adobe Systems Incorporated from and
	against any loss, damage, claims or lawsuits, including attorney's 
	fees that arise or result from your use or distribution of the source 
	code.
	
	THIS SOURCE CODE IS PROVIDED "AS IS" AND "WITH ALL FAULTS", WITHOUT 
	ANY TECHNICAL SUPPORT OR ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
	BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
	FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  ALSO, THERE IS NO WARRANTY OF 
	NON-INFRINGEMENT, TITLE OR QUIET ENJOYMENT.  IN NO EVENT SHALL MACROMEDIA
	OR ITS SUPPLIERS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
	EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
	PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
	OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
	WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR 
	OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOURCE CODE, EVEN IF
	ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

package com.adobe.utils
{
	import flexunit.framework.TestCase;
	import flexunit.framework.TestSuite;
	
	import com.adobe.utils.NumberFormatter;

	public class NumberFormatterTest extends TestCase
	{	
	    public function NumberFormatterTest(methodName:String = null)
        {
            super(methodName);
        }

		public function testAddLeadingZero():void
		{
			assertTrue("NumberFormatter.addLeadingZero(7) == \"07\"",
										NumberFormatter.addLeadingZero(7) == "07");
										
			assertTrue("NumberFormatter.addLeadingZero(9) == \"09\"",
										NumberFormatter.addLeadingZero(9) == "09");										
										
			assertTrue("NumberFormatter.addLeadingZero(0) == \"00\"",
										NumberFormatter.addLeadingZero(0) == "00");
										
			assertTrue("NumberFormatter.addLeadingZero(-1) == \"-1\"",
										NumberFormatter.addLeadingZero(-1) == "-1");
										
			assertTrue("NumberFormatter.addLeadingZero(10) == \"10\"",
										NumberFormatter.addLeadingZero(10) == "10");
										
			assertTrue("NumberFormatter.addLeadingZero(10000) == \"10000\"",
										NumberFormatter.addLeadingZero(10000) == "10000");

		}
		
		public function testAddSeperator():void
		{
			assertTrue('NumberFormatter.addSeparator(1000, ",") == "1,000"',
					NumberFormatter.addSeparator(1000, ",") == "1,000");
	
			assertTrue('NumberFormatter.addSeparator(90, ",") == "90"',
					NumberFormatter.addSeparator(90, ",") == "90");	

			//fail
			assertTrue('NumberFormatter.addSeparator(90.00, ",") == "90.00"',
					NumberFormatter.addSeparator(90.00, ",") == "90.00");	
	
			//fail
			assertTrue('NumberFormatter.addSeparator(90.0, ",") == "90.0"',
					NumberFormatter.addSeparator(90.0, ",") == "90.0");		
				
			//fail
			assertTrue('NumberFormatter.addSeparator(1000.00, ",") == "1,000.00"',
					NumberFormatter.addSeparator(1000.00, ",") == "1,000.00");				
	
			//fail
			assertTrue('NumberFormatter.addSeparator(1000.0, ",") == "1,000.0"',
					NumberFormatter.addSeparator(1000.0, ",") == "1,000.0");		
	
			//fail
			assertTrue('NumberFormatter.addSeparator(1000, ".") == "1.000"',
					NumberFormatter.addSeparator(1000, ".") == "1.000");	
					
			assertTrue('NumberFormatter.addSeparator(123456789, ",") == "123,456,789"',
					NumberFormatter.addSeparator(123456789, ",") == "123,456,789");
					
			assertTrue('NumberFormatter.addSeparator(123456789, "XXX") == "123XXX456XXX789"',
					NumberFormatter.addSeparator(123456789, "XXX") == "123XXX456XXX789");
			
			//fail : causes infinite loop		
			assertTrue('NumberFormatter.addSeparator(123456789, "1") == "12314561789"',
					NumberFormatter.addSeparator(123456789, "1") == "12314561789");
		}

	}
}