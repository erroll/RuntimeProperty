RuntimeProperty
===============

The aim of this project is to provide an easy to use and object-oriented way to object association in Cocoa. Using this code will allow you to append and recieve instance variables to any object at runtime.

NSObject+addRuntimeProperty
---------------------------

###- (void)setProperty:(id)property forKey:(char const * const)key withPolicy:(AssociantionPolicy)policy;
/**
 Sets the association between any property for a specific key.
 
 @param property - the associated object
 @param key - the key to identify the associated object
 @param policy - the memory management policy
 */


/**
 returns the associated object for a given key.
 
 @param key - the key to identify the associated object
 @return the assiciated object
 */
- (id)getPropertyForKey:(char const * const)key;

/**
 determines if there is a object for a given key.
 
 @param key - the key to identify the associated object
 @return a boolean value indicating if there is a associated object for a given key
 */
- (BOOL)hasPropertyForKey:(char const * const)key;
